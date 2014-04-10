class Notification < ActiveRecord::Base
  
  belongs_to :member
  belongs_to :attachable, :polymorphic => true

  validates_presence_of :member

  after_create :send_email

  named_scope :read, :conditions => {:read => true}
  named_scope :unread, :conditions => {:read => false}
  
  delegate :email, :to => :member, :prefix => true
  
  attr_boolean_accessor :skip_send_email
  
  def attachable_name
    return nil if attachable_type.blank?
    return "comment" if attachable_type == "WallPost"
    attachable_type.underscore.humanize
  end
  
  def has_attachable?
    !attachable.nil?
  end  
  
  def partial_name
    has_attachable? ? "notifications/#{attachable_type.underscore}" : "notifications/notification"
  end
  
  def read!
    update_attribute(:read, true)
  end
  
  def send_email?
    !skip_send_email? && !member.no_notification_emails? && !member.email.blank?
  end
  
  def unread
    !read
  end
  alias_method :unread?, :unread
  
  private
  def send_email
    return true if !send_email?
    if has_attachable? && Notifier.instance_methods.include?("notification_#{attachable_type.underscore}")
      Notifier.send("deliver_notification_#{attachable_type.underscore}", self)
    else
      Notifier.deliver_notification_notification(self)
    end
  end
  
end