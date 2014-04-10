require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class FriendOfAFriendshipTest < ActiveSupport::TestCase
  
  should belong_to(:friend_of_a_friend)
  should belong_to(:member)
  should have_and_belong_to_many(:mutual_friends)

  context "on creation" do
    
    setup do
      @member = Factory.create(:member)
      @friend_of_a_friend = Factory.create(:member)
    end
    
    should "create the inverse if it doesn't exist" do
      Factory.create(:friend_of_a_friendship, :member => @member, :friend_of_a_friend => @friend_of_a_friend)
      assert FriendOfAFriendship.exists?(:member_id => @friend_of_a_friend.id, :friend_of_a_friend_id => @member.id)
    end
    
    should "not create the inverse if it does already exist" do
      Factory.create(:friend_of_a_friendship, :member => @friend_of_a_friend, :friend_of_a_friend => @member)
      Factory.create(:friend_of_a_friendship, :member => @member, :friend_of_a_friend => @friend_of_a_friend)
      assert_equal 1, FriendOfAFriendship.count(:conditions => {:member_id => @friend_of_a_friend.id, :friend_of_a_friend_id => @member.id})
    end
    
  end
  
end
