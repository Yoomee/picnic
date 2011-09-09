PointsTransfer.class_eval do
  
  class << self
    
    def seed_points!
      # only seed points if there have been no points tranfers
      if PointsTransfer.count.zero?
        Member.all.each {|m| m.send(:trigger_points_event, :created_at => m.created_at)}
        Rating.all.each {|r| r.send(:trigger_points_event, :created_at => r.created_at)}
        WallPost.all.each {|wp| wp.send(:trigger_points_event, :created_at => wp.created_at)}
        Shout.all.each {|s| s.send(:trigger_points_event, :created_at => s.created_at)}
        FriendRequest.all.each {|m| m.send(:trigger_points_event, :created_at => m.created_at)}
      end
    end
    
  end
  
  def points_event_name_with_stories
    if points_event.try(:slug) == 'post_shout' && attachable.is_a?(Shout) && attachable.recipient.is_a?(Page)
      "Commenting on a story"
    else
      points_event_name_without_stories
    end
  end    
  alias_method_chain :points_event_name, :stories
  
end