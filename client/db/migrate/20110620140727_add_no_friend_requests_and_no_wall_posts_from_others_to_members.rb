class AddNoFriendRequestsAndNoWallPostsFromOthersToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :no_friend_requests, :boolean, :default => false
    add_column :members, :no_wall_posts_from_others, :boolean, :default => false
  end

  def self.down
    remove_column :members, :no_friend_requests
    remove_column :members, :no_wall_posts_from_others
  end
end
