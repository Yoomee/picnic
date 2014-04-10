class Message < ActiveRecord::Base

  belongs_to :member
  belongs_to :parent, :class_name => 'Message', :foreign_key => :parent_id
  has_many :children, :class_name => 'Message', :foreign_key => :parent_id, :dependent => :destroy
  has_many :message_recipients
  has_many :recipients, :through => :message_recipients, :source => :member, :uniq => true
  has_many :message_recipients_from_children, :through => :children, :source => :message_recipients
  
  validates_presence_of :member
  validates_presence_of :recipients
  validates_presence_of :text
  
  after_save :save_parent_as_self
  after_create :send_email

  named_scope :grouped_by_parent, :group => "messages.parent_id"
  named_scope :max_latest, :order => "max(messages.created_at) DESC"
  named_scope :not_deleted, :conditions => {:deleted => false}
  named_scope :parents, :conditions => "messages.parent_id = messages.id"
  
  accepts_mail_response if ApplicationController::plugin_installed?(:tramlines_mail_response)
  
  alias_method :author, :member

  def build_reply(attributes = {})
    attributes.reverse_merge!(:member => recipient, :subject => subject, :recipients => (recipients.dup << member).uniq)
    attributes[:recipients].delete(attributes[:member])
    (parent || self).children.build(attributes)
  end

  def create_reply!(attributes = {})
    build_reply(attributes).save!
  end
  
  def delete_for!(member)
    return false if member.nil?
    parent.message_recipients_from_children.for_member(member).each do |message_recipient|
      message_recipient.update_attribute(:deleted, true)
    end
  end
  
  def member_thats_not(member)
     return author if author != member
     recipients.not_including(member).limit(1).first
  end

  def multiple_recipients?
    recipient_ids.size > 1
  end

  def newest_child
    parent.children.latest.limit(1).first
  end
  
  def newest_child_sent_by(member)
    parent.children.member_id_is(member.id).latest.limit(1).first
  end

  def process_mail_response(attrs = {})
    create_reply!(:member => attrs[:member], :text => attrs[:response])
  end

  def read_by!(member)
    parent.message_recipients_from_children.for_member(member).each(&:read!)
  end

  def read_by?(member)
    return true if owned_by?(member)
    message_recipients.for_member(member).all?(&:read?)
    # message_recipient.nil? ? false : message_recipient.read?
  end

  def recipient
    recipients.first
  end
  
  def sent_time
    created_at.strftime('%b %d at %H:%M')
  end
  
  def subject
    read_attribute(:subject).blank? ? "No Subject" : read_attribute(:subject)
  end
  
  # checks if there are any messages in the thread unread by member
  def thread_read_by?(member)
    parent.message_recipients_from_children.for_member(member).all?(&:read?)
  end

  def to_s
    subject
  end
  
  def un_read_by!(member)
    parent.message_recipients_from_children.for_member(member).each(&:un_read!)
  end

  private
  def delete_all_sibling_messages
    parent.children.destroy_all
  end
  
  def save_parent_as_self
    self.update_attribute(:parent_id, self.id) if parent.nil?
    true
  end

  def send_email
    recipients.each do |recipient|
      Notifier.deliver_new_inbox_message(self, recipient)
    end
    true
  end
  
end
