class AddWeightToVenues < ActiveRecord::Migration
  def self.up
    add_column :venues, :weight, :integer, :default => 0
  end

  def self.down
    remove_column :venues, :weight
  end
end
