class AddMutualFriendships < ActiveRecord::Migration
  
  def self.up
    create_table :mutual_friendships, :id => false do |t|
      t.integer :friend_of_a_friendship_id
      t.integer :mutual_friend_id
    end
  end

  def self.down
    drop_table :mutual_friendships
  end
  
end
