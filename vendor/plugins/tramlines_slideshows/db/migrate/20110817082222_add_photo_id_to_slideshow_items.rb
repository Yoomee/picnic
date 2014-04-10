class AddPhotoIdToSlideshowItems < ActiveRecord::Migration
  def self.up
    remove_column :slideshow_items, :image_uid
    add_column :slideshow_items, :photo_id, :integer
  end

  def self.down
    remove_column :slideshow_items, :photo_id
    add_column :slideshow_items, :image_uid, :string
  end
end
