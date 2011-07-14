class AddImageToFrontCovers < ActiveRecord::Migration
  
  def self.up
    add_column :front_covers, :image_uid, :string
  end

  def self.down
    remove_column :front_covers, :image_uid
  end
  
end
