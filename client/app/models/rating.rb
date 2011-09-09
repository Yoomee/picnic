Rating.class_eval do
  
  after_create :trigger_points_event
  
  private
  def trigger_points_event(options = {})
    rateable_member = get_rateable_member(rateable)
    puts "rateable_member = #{rateable_member}"
    return true if rateable_member == member
    puts "rateable_type = #{rateable_type}"
    case rateable_type
    when "Shout"
      rateable.member.handle_points_event((positive? ? :like_my_shout : :dislike_my_shout), rateable, options)
      member.handle_points_event(:rate_shout, rateable, options)
    when "Member"
      if positive?
        rateable.handle_points_event(:like_my_profile, rateable, options)
      end
    when "Page"
      puts "HANDLING"
      member.handle_points_event(:rate_page, rateable, options)
    end
  end
  
  
  private
  def get_rateable_member(rateable)
    case 
    when rateable.is_a?(Member)
      rateable
    when rateable.respond_to?(:member)
      rateable.member
    else 
      nil
    end
  end
end