class CreateShouts < ActiveRecord::Migration
  def self.up
    create_table :shouts do |t|
      t.belongs_to :member
      t.belongs_to :attachable, :polymorphic => true
      t.text :text
      t.boolean :delta, :default => true
      t.timestamps
    end
    add_index :shouts, :member_id
  end

  def self.down
    remove_index :shouts, :member_id
    drop_table :shouts
  end
end
