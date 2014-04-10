class CreateSlideshows < ActiveRecord::Migration
  
  def self.up
    create_table :slideshows do |t|
      t.belongs_to :attachable, :polymorphic => true
      t.boolean :active, :default => false
      t.timestamps
    end
    create_table :slideshow_items do |t|
      t.belongs_to :slideshow
      t.text :text
      t.string :image_uid
      t.integer :position
      t.timestamps
    end  
  end

  def self.down
    drop_table :slideshow_items
    drop_table :slideshows
  end
    
end
