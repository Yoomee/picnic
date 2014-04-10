class CreateNotificationsWallPosts < ActiveRecord::Migration
  def self.up
    create_table :notifications_wall_posts, :id => false do |t|
      t.integer :notification_id
      t.integer :wall_post_id
    end
  end

  def self.down
    drop_table :notifications_wall_posts
  end
end
