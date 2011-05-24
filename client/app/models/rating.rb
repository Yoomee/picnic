Rating.class_eval do
  
  after_create :trigger_points_event
  
  private
  def trigger_points_event(options = {})
    return true if rateable_type != "Shout" || rateable.member == member
    rateable.member.handle_points_event((positive? ? :like_my_shout : :dislike_my_shout), rateable, options)
    member.handle_points_event(:rate_shout, rateable, options)
  end
  
end