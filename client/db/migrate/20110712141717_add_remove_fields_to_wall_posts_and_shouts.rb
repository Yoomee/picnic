class AddRemoveFieldsToWallPostsAndShouts < ActiveRecord::Migration
  def self.up
    add_column :wall_posts, :removed_at, :datetime
    add_column :wall_posts, :removed_by_id, :integer
    add_column :shouts, :removed_at, :datetime
    add_column :shouts, :removed_by_id, :integer
  end

  def self.down
    remove_column :wall_posts, :removed_at
    remove_column :wall_posts, :removed_by_id
    remove_column :shouts, :removed_at
    remove_column :shouts, :removed_by_id
  end
end
