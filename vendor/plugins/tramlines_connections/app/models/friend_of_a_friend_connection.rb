class FriendOfAFriendConnection < Connection

  attr_reader :mutual_friends

  class << self
    
    private
    def args_for_initialize(member, options = {})
      member.friend_of_a_friendships
    end
    
  end
  
  def initialize(friend_of_a_friendship)
    @member = friend_of_a_friendship.friend_of_a_friend
    @mutual_friends = friend_of_a_friendship.mutual_friends
  end

end
