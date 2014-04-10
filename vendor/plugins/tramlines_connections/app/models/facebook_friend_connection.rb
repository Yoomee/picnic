class FacebookFriendConnection < Connection

  extend Forwardable
  
  def_delegator :@member, :fb_user_id
  
  class << self

    private
    def args_for_initialize(member, options = {})
      if facebook_user = options[:facebook_user]
        #Don't crash on OAuthExpired
        #Use refresh_fb_session before_filter in controller
        begin
          friend_ids = facebook_user.friends.map(&:id)
          Member.without_friend_request_with(member).find(:all, :conditions => ["fb_user_id IN (?)", friend_ids])
        rescue Mogli::Client::OAuthException, Errno::ECONNRESET
          []
        end
      else
        []
      end
    end

  end
  
  def initialize(member)
    @member = member
  end
  
end