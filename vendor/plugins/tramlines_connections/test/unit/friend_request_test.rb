require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class FriendRequestTest < ActiveSupport::TestCase
  
  context "on acceptance" do
    
    setup do
      @member = Factory.create(:member, :surname => "Member")
      @friend = Factory.create(:member, :surname => "Friend")
      @friend_request = Factory.create(:friend_request, :member => @member, :member_target => @friend)
      @friend_of_a_friend = Factory.create(:member, :surname => "Friend of a Friend")
      Factory.create(:friendship, :member => @friend, :member_target => @friend_of_a_friend)
    end
    
    should "add the mutual friend to the existing FriendOfAFriendship if one already exists" do
      friend_of_a_friendship = Factory.create(:friend_of_a_friendship, :member => @member, :friend_of_a_friend => @friend_of_a_friend)
      @friend_request.accept!
      assert_equal [@friend], friend_of_a_friendship.mutual_friends(true)
    end

    should "add the mutual friend to the existing reverse FriendOfAFriendship if one already exists" do
      friend_of_a_friendship = Factory.create(:friend_of_a_friendship, :member => @friend_of_a_friend, :friend_of_a_friend => @member)
      @friend_request.accept!
      assert_equal [@friend], friend_of_a_friendship.mutual_friends(true)
    end
    
    should "create a FriendOfAFriendship from the friend of the friend to the member" do
      @friend_request.accept!
      assert FriendOfAFriendship.exists?(:member_id => @friend_of_a_friend.id, :friend_of_a_friend_id => @member.id)
    end
    
    should "create a FriendOfAFriendship to the friend of the friend" do
      @friend_request.accept!
      assert FriendOfAFriendship.exists?(:member_id => @member.id, :friend_of_a_friend_id => @friend_of_a_friend.id)
    end
    
    should "not create a FriendOfAFriendship from the friend to themselves" do
      @friend_request.accept!
      assert !FriendOfAFriendship.exists?(:member_id => @friend_of_a_friend.id, :friend_of_a_friend_id => @friend_of_a_friend.id)
    end
    
    should "not create a FriendOfAFriendship from the member to themselves" do
      @friend_request.accept!
      assert !FriendOfAFriendship.exists?(:member_id => @member.id, :friend_of_a_friend_id => @member.id)
    end

    should "not create a FriendOfAFriendship if a FriendRequest exists between the pair" do
      Factory.create(:friend_request, :member => @member, :member_target => @friend_of_a_friend)
      @friend_request.accept!
      assert !FriendOfAFriendship.exists?(:member_id => @member.id, :friend_of_a_friend_id => @friend_of_a_friend.id)
    end
    
    should "not create a FriendOfAFriendship if one already exists" do
      Factory.create(:friend_of_a_friendship, :member => @member, :friend_of_a_friend => @friend_of_a_friend)
      @friend_request.accept!
      assert_equal 1, FriendOfAFriendship.count(:conditions => {:member_id => @member.id, :friend_of_a_friend_id => @friend_of_a_friend.id})
    end

    should "not create a reverse FriendOfAFriendship if one already exists" do
      Factory.create(:friend_of_a_friendship, :member => @friend_of_a_friend, :friend_of_a_friend => @member)
      @friend_request.accept!
      assert_equal 1, FriendOfAFriendship.count(:conditions => {:member_id => @friend_of_a_friend.id, :friend_of_a_friend_id => @member.id})
    end

    should "not create a FriendOfAFriendship in reverse if a FriendRequest exists between the pair" do
      Factory.create(:friend_request, :member => @member, :member_target => @friend_of_a_friend)
      @friend_request.accept!
      assert !FriendOfAFriendship.exists?(:member_id => @friend_of_a_friend.id, :friend_of_a_friend_id => @member.id)
    end
      
    should "set the mutual friend for the friend of the friend to the member" do
      @friend_request.accept!
      friend_of_a_friendship = FriendOfAFriendship.find_by_member_id_and_friend_of_a_friend_id(@friend_of_a_friend.id, @member.id)
      assert_equal [@friend], friend_of_a_friendship.mutual_friends
    end
    
    should "set the mutual friend for the member to the friend of the friend" do
      @friend_request.accept!
      friend_of_a_friendship = FriendOfAFriendship.find_by_member_id_and_friend_of_a_friend_id(@member.id, @friend_of_a_friend.id)
      assert_equal [@friend], friend_of_a_friendship.mutual_friends
    end
    
  end
  
  context "on creation" do
    
    setup do
      @member = Factory.create(:member)
      @friend = Factory.create(:member)
      Factory.create(:friend_of_a_friendship, :member => @member, :friend_of_a_friend => @friend)
      Factory.create(:friend_of_a_friendship, :member => @friend, :friend_of_a_friend => @member)
      Factory.create(:friend_request, :member => @member, :member_target => @friend)
    end
    
    should "destroy a FriendOfAFriendship between the two members" do
      assert !FriendOfAFriendship.exists?(:member_id => @member.id, :friend_of_a_friend_id => @friend.id)
    end
    
    should "destroy the FriendOfAFriendship in the other direction between the two members" do
      assert !FriendOfAFriendship.exists?(:member_id => @friend.id, :friend_of_a_friend_id => @member.id)
    end
    
  end
  
end
