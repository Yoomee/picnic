module TramlinesShouts::NotificationExtensions

  def self.included(klass)
    # the comments this notification refers
    klass.has_and_belongs_to_many(:wall_posts)
    klass.named_scope(:for_shout, lambda {|shout| {:conditions => {:attachable_type => "Shout", :attachable_id => shout.id}}})
    # notifications about a shout or the comments/wall_posts on that shout
    klass.named_scope(:related_to_shout, lambda {|shout| {:conditions => ["(attachable_type = 'Shout' AND attachable_id = ?) OR (attachable_type = 'WallPost' AND attachable_id IN (?))", shout.id, shout.wall_posts.collect(&:id)]}})
    klass.named_scope(:with_wall_posts, :joins => :wall_posts)
  end
    
  # members that own the comments that this notification relates to
  def wall_post_members
    Member.related_to_notification(self)
  end

end