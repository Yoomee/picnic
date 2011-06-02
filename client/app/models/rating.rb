Rating.class_eval do
  
  after_create :trigger_points_event
  
  private
  def trigger_points_event(options = {})
    return true if (rateable.is_a?(Member) ? rateable : rateable.member) == member
    case rateable_type
    when "Shout"
      rateable.member.handle_points_event((positive? ? :like_my_shout : :dislike_my_shout), rateable, options)
      member.handle_points_event(:rate_shout, rateable, options)
    when "Member"
      if positive?
        rateable.handle_points_event(:like_my_profile, rateable, options)
      end
    end
  end
  
end