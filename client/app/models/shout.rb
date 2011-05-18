Shout.class_eval do

  before_validation :set_attachable

  after_update :destroy_old_attachable

  attr_boolean_accessor :themes_form_step, :delete_attachable

  attr_accessor :shout_type, :video_url, :link_url, :photo_image, :poll_question, :attachable_to_be_deleted
  
  include TramlinesImages
  
  has_location
  has_permalink
  
  def has_image?
    attachable.try(:has_image?)
  end
  
  def image
    attachable.try(:image)
  end
  
  def related_shouts
    Shout.random.limit(3)
  end
  
  def to_s
    title || ''
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
  
  def set_attachable
    if delete_attachable?
      self.attachable_to_be_deleted = attachable
      self.attachable = nil
    else
      if shout_type=="Link" && Video.is_video_url?(link_url.to_s)
        self.shout_type = 'Video'
        self.video_url = link_url
      end
      case shout_type
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