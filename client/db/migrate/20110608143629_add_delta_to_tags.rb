class AddDeltaToTags < ActiveRecord::Migration
  
  def self.up
    add_column :tags, :delta, :boolean, :default => true
  end

  def self.down
    remove_column :tags, :delta
  end
  
end
