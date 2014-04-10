class AddTitleToSlideshowItems < ActiveRecord::Migration
  def self.up
    add_column :slideshow_items, :title, :string
  end

  def self.down
    remove_column :slideshow_items, :title
  end
end
