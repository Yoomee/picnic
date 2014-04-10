class CreateFriendOfAFriendship < ActiveRecord::Migration
  
  def self.up
    create_table :friend_of_a_friendships do |t|
      t.integer :member_id
      t.integer :friend_of_a_friend_id
    end
  end

  def self.down
    drop_table :friend_of_a_friendships
  end
  
end
