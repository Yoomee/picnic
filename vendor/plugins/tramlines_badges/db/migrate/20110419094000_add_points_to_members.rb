class AddPointsToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :points, :integer, :default => 0
  end

  def self.down
    remove_column :members, :points
  end
end
