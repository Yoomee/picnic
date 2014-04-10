class CreateNotifications < ActiveRecord::Migration
  
  def self.up
    create_table :notifications do |t|
      t.belongs_to :member
      t.belongs_to :attachable, :polymorphic => true
      t.text :text
      t.timestamps
    end
  end

  def self.down
    drop_table :notifications
  end
  
end
