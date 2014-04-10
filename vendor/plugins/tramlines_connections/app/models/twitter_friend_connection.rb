class TwitterFriendConnection < Connection

  extend Forwardable
  def_delegator :@member, :twitter_username

  class << self

    private
    def args_for_initialize(member, options = {})
      twitter_friends = member.twitter_friends
      return [] if twitter_friends.empty?
      twitter_friends
    end

  end

  def initialize(twitter_friend)
    @member = twitter_friend
  end

end
