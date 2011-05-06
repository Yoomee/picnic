class AddImageAndDescriptionToTags < ActiveRecord::Migration
  
  def self.up
    add_column :tags, :image_uid, :string
    add_column :tags, :description, :text
  end

  def self.down
    remove_column :tags, :description
    remove_column :tags, :image_uid
  end
  
end
