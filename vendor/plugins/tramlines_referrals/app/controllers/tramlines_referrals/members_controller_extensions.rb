module TramlinesReferrals::MembersControllerExtensions
  
  def self.included(klass)
    klass.after_filter :add_referrer_points, :only => :create
  end
  
  private
  def add_referrer_points
    if @member && !@member.new_record? && session[:logged_in_member_id] == @member.id && session[:referrer_id]
      referrer = Member.find(session[:referrer_id])
      referrer.try(:handle_points_event, :referred_friend, @member)
    end
  end
  
end
      