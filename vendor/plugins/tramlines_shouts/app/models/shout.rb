class Shout < ActiveRecord::Base
    
  belongs_to :member
  belongs_to :recipient, :polymorphic => true  
  belongs_to :attachable, :polymorphic => true, :dependent => :destroy, :autosave => true
  
  has_many :notifications, :as => :attachable, :dependent => :destroy

  before_validation :set_attachable

  after_update :destroy_old_attachable
  after_create :notify_recipient

  attr_boolean_accessor :tags_form_step
  
  has_wall
  acts_as_taggable
  add_to_news_feed
  rateable_by_member
    
  has_many :issues, :through => :taggings, :source => :tag
  
  define_index do
    indexes :text
    indexes wall_posts.text, :as => :comments
    # TODO: search issues
    # indexes issues.text, :as => :issues
    has created_at, updated_at, member_id
    set_property :delta => true    
  end
  
  named_scope :actions, lambda { with_lat_lng.scope(:find) }
  named_scope :top_rated, :joins => "LEFT OUTER JOIN ratings ON (ratings.rateable_id = shouts.id AND ratings.rateable_type = 'Shout')", :group => "shouts.id", :order => "AVG(IFNULL(ratings.score, 0)) DESC, MAX(ratings.created_at) DESC"
  named_scope :with_text, :conditions => "shouts.text IS NOT NULL AND shouts.text != ''"
  
  named_scope :most_commented_on, :select => "shouts.*, COUNT(wall_posts.id) AS wall_post_count", :joins => "INNER JOIN walls ON (shouts.id = walls.attachable_id AND walls.attachable_type = 'Shout') LEFT OUTER JOIN wall_posts ON (wall_posts.wall_id = walls.id)", :group => "shouts.id", :order => "wall_post_count DESC, shouts.created_at DESC"
  # shouts owned by member or commented on by member
  named_scope :for_member, lambda {|member| {:joins => "INNER JOIN walls ON (shouts.id = walls.attachable_id AND walls.attachable_type = 'Shout') LEFT OUTER JOIN wall_posts ON (wall_posts.wall_id = walls.id)", :group => "shouts.id", :conditions => ["shouts.member_id = :id OR wall_posts.member_id = :id",{:id => member.try(:id)}]}}
  named_scope :not_for_member, lambda {|member| {:joins => "INNER JOIN walls ON (shouts.id = walls.attachable_id AND walls.attachable_type = 'Shout') LEFT OUTER JOIN wall_posts ON (wall_posts.wall_id = walls.id)", :group => "shouts.id", :conditions => ["shouts.member_id <> :id AND wall_posts.member_id <> :id",{:id => member.try(:id)}]}}
  named_scope :for_recipient, lambda{|recipient| {:conditions => {:recipient_type => recipient.class.to_s, :recipient_id => recipient.try(:id)}}}
  
  named_scope :for_member_or_recipient, lambda {|member| {:joins => "LEFT OUTER JOIN walls ON (shouts.id = walls.attachable_id AND walls.attachable_type = 'Shout') LEFT OUTER JOIN wall_posts ON (wall_posts.wall_id = walls.id)", :group => "shouts.id", :conditions => ["(shouts.member_id = :id OR wall_posts.member_id = :id) OR (shouts.recipient_type = 'Member' AND shouts.recipient_id = :id)", {:id => member.try(:id)}]}}
  
  
  attr_boolean_accessor :issues_form_step, :delete_attachable
  attr_accessor :attach_type, :video_url, :link_url, :photo_image, :document_file, :document_name, :attachable_to_be_deleted
  
  def attach_options
    [:photo, :link, :video]
  end
  
  def attach_type
    @attach_type.blank? ? attachable_type : @attach_type
  end
  
  def can_attach?(attach_name)
    attach_options.include?(attach_name.to_sym)
  end
  
  def has_recipient?
    !recipient.blank?
  end
  
  def has_valid_tags?
    if tag_list.empty?
      self.errors.add_to_base("You need to add at least one issue.")
    else
      tags_with_errors = Tag.create_tag_list(self.tag_list).reject(&:valid?)
      return true if tags_with_errors.empty?
      self.errors.add_to_base("Sorry, you can't use these words: #{tags_with_errors.collect(&:name).to_sentence}")
    end
    false
  end

  def has_document?
    attachable_type=="Document"
  end

  def has_link?
    attachable_type=="Link"
  end

  def has_photo?
    attachable_type=="Photo"
  end
  
  def has_video?
    attachable_type=="Video"
  end
  
  def has_attachable?
    !attachable.nil?
  end
  
  def is_commentable?
    true
  end
  
  def pretty_date
    if created_at.year == Time.now.year
      created_at.strftime("%d %b")
    else
      created_at.strftime("%d %b %Y")
    end
  end
  
  def read_notifications!(member)
    member.notifications.related_to_shout(self).each(&:read!)
  end
  
  def removeable?
    self.class::column_names.include?("removed_at")
  end
  
  def removed
    removeable? && !removed_at.blank?
  end
  alias_method :removed?, :removed
  
  def share_subject
    "Check out this discussion#{tag_list.blank? ? '' : ' about ' + tag_list.to_sentence}"
  end
  
  def share_message
    "Hi,\n\nI saw this discussion #{tag_list.blank? ? '' : 'about ' + tag_list.to_sentence} and I thought you might be interested as well:\n\n"
  end
  
  def summary_fields #for search result display
    [:text]
  end

  def document_file
    return @document_file if !@document_file.blank?
    return nil if !has_attachable?
    (new_record? || attachable_type != "Document") ? nil : attachable.file
  end

  def document_name
    return @document_name if !@document_name.blank?
    return nil if !has_attachable?
    (new_record? || attachable_type != "Document") ? nil : attachable.name
  end

  def photo_image
    return @photo_image if !@photo_image.blank?
    return nil if !has_attachable?
    (new_record? || attachable_type != "Photo") ? nil : attachable.image
  end

  def link_url
    return @link_url if !@link_url.blank?
    return nil if !has_attachable?    
    (new_record? || attachable_type != "Link") ? nil : attachable.url
  end
  
  def video_url
    return @video_url if !@video_url.blank?
    return nil if !has_attachable?    
    (new_record? || attachable_type != "Video") ? nil : attachable.url
  end
  
  def validate
    return true if attachable.nil? || attachable.valid?
    case attach_type
    when 'Video'
      self.errors.add(:video_url, attachable.errors.on(:url))
    when 'Photo'
      self.errors.add(:photo_image, attachable.errors.on(:image))
    when 'Link'
      self.errors.add(:link_url, attachable.errors.on(:url))
    when 'Document'
      self.errors.add(:document_file, attachable.errors.on(:file))
      self.errors.add(:document_name, attachable.errors.on(:name))
    end
  end
  
  private
  
  def notify_recipient
    return true if recipient_type != 'Member' || recipient_id == member_id
    notification = recipient.notifications.create(:attachable => self, :skip_send_email => true)
    if recipient.send_email_for_shout?(self)
      Notifier.deliver_notification_shout(notification)
    end
  end
  
  def set_attachable
    if delete_attachable?
      self.attachable_to_be_deleted = attachable
      self.attachable = nil
    else
      if attach_type=="Link" && Video.is_video_url?(link_url.to_s)
        self.attach_type = 'Video'
        self.video_url = link_url
      end
      case attach_type
      when 'Video'
        if new_record? || (!video_url.blank? && !attachable.is_a?(Video))
          self.attachable_to_be_deleted = attachable unless attachable.nil?
          self.attachable = Video.new(:member => member, :url => video_url)
        elsif !video_url.blank?
          attachable.url = video_url
        end
      when 'Photo'
        if new_record? || (!photo_image.blank? && !attachable.is_a?(Photo))
          self.attachable_to_be_deleted = attachable unless attachable.nil?
          self.attachable = Photo.new(:member => member, :image => photo_image)
        elsif !photo_image.blank?
          attachable.image = photo_image
        end
      when 'Link'
        if new_record? || (!link_url.blank? && !attachable.is_a?(Link))
          self.attachable_to_be_deleted = attachable unless attachable.nil?
          self.attachable = Link.new(:member => member, :url => link_url)
        elsif !link_url.blank?
          attachable.url = link_url
        end
      when 'Document'
        if new_record? || ((!document_file.blank? || !document_name.blank?) && !attachable.is_a?(Document))
          self.attachable_to_be_deleted = attachable unless attachable.nil?
          self.attachable = Document.new(:member => member, :file => document_file, :name => document_name)
        else
          attachable.file = document_file if !document_file.blank? && (attachable.file != document_file)
          attachable.name = document_name if !document_name.blank?
        end
      when 'PollQuestion'
       if new_record? || (!poll_question.nil? && !attachable.is_a?(PollQuestion))
         self.attachable_to_be_deleted = attachable unless attachable.nil?
         self.poll_question.member = member
         self.attachable = poll_question
       elsif !poll_question.nil?
         self.attachable = poll_question
       end
      end
      self.attachable.skip_news_feed = true if self.attachable.respond_to?(:skip_news_feed)
    end
  end
  
  def destroy_old_attachable
    attachable_to_be_deleted.destroy if !attachable_to_be_deleted.nil?
    true
  end
  
end
Shout::ROUTES_NAME = "shouts"