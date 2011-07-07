Shout.class_eval do

  after_create :trigger_points_event, :notify_subscribers
  after_destroy :trigger_reverse_points_event

  attr_boolean_accessor :themes_form_step, :delete_attachable

  attr_accessor :shout_type
  
  include TramlinesImages
  
  
  #TODO Investigate if there is max lenght, or performance issues with lots of friends
  named_scope :by_friends_of, lambda {|member| {:joins => "INNER JOIN walls ON (shouts.id = walls.attachable_id AND walls.attachable_type = 'Shout') LEFT OUTER JOIN wall_posts ON (wall_posts.wall_id = walls.id)", :group => "shouts.id", :conditions => ["shouts.member_id IN (:ids) OR wall_posts.member_id IN (:ids)", {:ids => member.friend_ids}]}}
  
  
  has_location
  has_permalink
  
  
  class << self
    def get_shouts(filter_name, member)
      case filter_name
      when "latest"
        latest
      when "comments"
        most_commented_on
      when "popular"
        top_rated
      when "blanket"
        by_friends_of(member)
      else
        latest
      end
    end
  end
  
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
      self.errors.add_to_base("You need to add at least one tag.")
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
  
  def trigger_points_event(options = {})
    member.handle_points_event(:post_shout, self, options)
  end
  
  def trigger_reverse_points_event(options = {})
    member.handle_points_event(:deleted_posted_shout, nil, options)
  end
  
  private
  def notify_subscribers
    subscribers = Member.subscribed_to_tags(tags) + Member.subscribed_to_member(member)
    subscribers.uniq.each do |subscriber|
      subscriber.notifications.create(:attachable => self) unless subscriber.in?([member, recipient])
    end
  end
  
end