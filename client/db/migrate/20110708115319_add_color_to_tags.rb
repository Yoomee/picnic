class AddColorToTags < ActiveRecord::Migration
  def self.up
    add_column :tags, :color, :string
  end

  def self.down
    remove_column :tags, :color
  end
end
