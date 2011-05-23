Rating.class_eval do
  
  after_create :trigger_points_event
  
  private
  def trigger_points_event(options = {})
    return true if rateable_type != "Shout" || rateable.member == member
    rateable.member.handle_points_event((positive? ? :like_my_discussion : :dislike_my_discussion), rateable, options)
    member.handle_points_event(:rate_discussion, rateable, options)
  end
  
end