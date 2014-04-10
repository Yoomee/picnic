module TramlinesConnections::FriendRequestExtensions
  
  def self.included(klass)
    klass.after_create(:destroy_friend_of_a_friendships)
    klass.alias_method_chain :accept!, :friend_of_a_friendships
  end
  
  def accept_with_friend_of_a_friendships!
    create_friend_of_a_friendships
    accept_without_friend_of_a_friendships!
  end
  
  private
  def create_friend_of_a_friendships
    member.friends.each do |friend|
      unless skip_friend_of_a_friendship_addition?(member_target, friend)
        friend_of_a_friendship = FriendOfAFriendship.find_or_initialize_by_member_id_and_friend_of_a_friend_id(member_target.id, friend.id)
        friend_of_a_friendship.mutual_friends << member
        friend_of_a_friendship.save!
      end
    end
    member_target.friends.each do |friend|
      unless skip_friend_of_a_friendship_addition?(member, friend)
        friend_of_a_friendship = FriendOfAFriendship.find_or_initialize_by_member_id_and_friend_of_a_friend_id(member.id, friend.id)
        friend_of_a_friendship.mutual_friends << member_target
        friend_of_a_friendship.save!
      end
    end
  end
  
  def destroy_friend_of_a_friendships
    member.friend_of_a_friendships.find_all_by_friend_of_a_friend_id(member_target.id).each(&:destroy)
    member_target.friend_of_a_friendships.find_all_by_friend_of_a_friend_id(member.id).each(&:destroy)
  end
  
  def skip_friend_of_a_friendship_addition?(from_member, to_member)
    from_member == to_member || self.class::exists_between?(from_member, to_member)
  end

end