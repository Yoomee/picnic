module TramlinesShouts::MemberExtensions
  
  def self.included(klass)
    klass.has_many(:received_shouts, :as => :recipient, :class_name => 'Shout')
    klass.has_many(:recipientless_shouts, :class_name=> 'Shout', :conditions => "recipient_id IS NULL")
    klass.has_many(:shouts_without_member_recipient, :class_name=> 'Shout', :conditions => "recipient_type != 'Member'")
    klass.has_many(:shouts, :dependent => :destroy)
    klass.after_destroy(:nullify_received_shouts)
    klass.named_scope :related_to_notification, lambda {|notification| {:joins => ["INNER JOIN notifications_wall_posts ON (notifications_wall_posts.notification_id = #{notification.id}) INNER JOIN wall_posts ON (wall_posts.id = notifications_wall_posts.wall_post_id)"], :conditions => "wall_posts.member_id = members.id", :group => "members.id", :order => "wall_posts.created_at"}}
    klass.named_scope :top_posters, 
      :select => "members.*, COUNT(DISTINCT shouts.id) AS shout_count, COUNT(DISTINCT wall_posts.id) AS wall_post_count, (COUNT(DISTINCT shouts.id) + COUNT(DISTINCT wall_posts.id)) AS post_count", 
      :joins => "LEFT OUTER JOIN shouts ON (shouts.member_id = members.id) LEFT OUTER JOIN wall_posts ON (wall_posts.member_id = members.id)",
      :conditions => "shouts.id IS NOT NULL OR wall_posts.id IS NOT NULL",
      :group => "members.id",
      :order => "post_count DESC"
    klass.named_scope :top_posters_since, lambda{|date| {
      :select => "members.*, COUNT(DISTINCT shouts.id) AS shout_count, COUNT(DISTINCT wall_posts.id) AS wall_post_count, (COUNT(DISTINCT shouts.id) + COUNT(DISTINCT wall_posts.id)) AS post_count", 
      :joins => "LEFT OUTER JOIN shouts ON (shouts.member_id = members.id AND shouts.created_at >= '#{date.to_date}') LEFT OUTER JOIN wall_posts ON (wall_posts.member_id = members.id AND wall_posts.created_at >= '#{date.to_date}')",
      :conditions => "shouts.id IS NOT NULL OR wall_posts.id IS NOT NULL",
      :group => "members.id",
      :order => "post_count DESC"
    }}
    # This currently only supports :any algorithm of tag matching
    klass.named_scope :with_shout_tags, lambda {|tag_list| {:joins => "INNER JOIN shouts ON shouts.member_id=members.id INNER JOIN taggings ON taggings.taggable_id=shouts.id INNER JOIN tags ON taggings.tag_id=tags.id", :conditions => ["taggings.taggable_type='Shout' AND shouts.member_id=members.id AND tags.name IN (?)", tag_list], :group => "members.id"}}
  end
  
  def has_received_shouts?
    !received_shouts.empty?
  end
  
  def has_recipientless_shouts?
    !recipientless_shouts.empty?
  end
  
  def profile_shouts
    Shout.for_member_or_recipient(self)
  end

  def send_email_for_shout?(shout)
    return false if email.blank? || no_notification_emails?
    if shout.owned_by?(self)
      email_for_my_shouts? #notify when others comment on my shout
    elsif shout.recipient == self
      email_for_profile_shouts? #notify when somebody posts on my profile
    else
      email_for_my_comments? #notify when others comment on stuff I've commented on
    end
  end

  def shout_tag_list
    shout_tags.map(&:name)
  end

  def shout_tags
    Tag.for_shouts_by_member(self)
  end

  private
  def nullify_received_shouts
    received_shouts.all.each {|s| s.update_attribute(:recipient, nil)}
  end
  
end
