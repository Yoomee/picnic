class AddActivatedToFrontCovers < ActiveRecord::Migration
  
  def self.up
    add_column :front_covers, :activated, :boolean, :default => false
  end

  def self.down
    remove_column :front_covers
  end
  
end
