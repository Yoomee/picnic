class AddVersionToConferences < ActiveRecord::Migration
  def self.up
    add_column :conferences, :version, :integer, :default => 1
  end

  def self.down
    remove_column :conferences, :version
  end
end
