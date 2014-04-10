class AddVideoFieldsToSlideshowItems < ActiveRecord::Migration
  def self.up
    add_column :slideshow_items, :video_url, :string
    add_column :slideshow_items, :video_html, :text
    add_column :slideshow_items, :video_image_uid, :string
  end

  def self.down
    remove_column :slideshow_items, :video_image_uid
    remove_column :slideshow_items, :video_html
    remove_column :slideshow_items, :video_url
  end
end
