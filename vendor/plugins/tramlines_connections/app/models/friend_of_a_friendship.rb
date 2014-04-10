class FriendOfAFriendship < ActiveRecord::Base
  
  belongs_to :member
  belongs_to :friend_of_a_friend, :class_name => 'Member'
  
  has_and_belongs_to_many :mutual_friends, :class_name => 'Member', :join_table => :mutual_friendships, :uniq => true, :association_foreign_key => 'mutual_friend_id'
  
  after_create :create_inverse
  after_update :update_inverse_mutual_friends
  
  attr_writer :is_inverse
  
  private
  def create_inverse
    unless @is_inverse || self.class::exists?(:member_id => friend_of_a_friend_id, :friend_of_a_friend_id => member_id)
      self.class::create!(:member_id => friend_of_a_friend_id, :friend_of_a_friend_id => member_id, :is_inverse => true, :mutual_friends => mutual_friends) 
    end
  end
  
  def inverse
    self.class::find_by_member_id_and_friend_of_a_friend_id(friend_of_a_friend_id, member_id)
  end
  
  def update_inverse_mutual_friends
    inverse.update_attributes!(:mutual_friends => mutual_friends, :is_inverse => true) unless @is_inverse
  end
  
end
