class CreateBadges < ActiveRecord::Migration
  def self.up
    create_table :badges do |t|
      t.string :ref
      t.string :name
      t.text :description
      t.string :image_uid
    end
    create_table :badge_awardings do |t|
      t.integer :badge_id
      t.integer :member_id
      t.boolean :announced, :default => false
      t.timestamps
    end
    add_index :badge_awardings, :badge_id
    add_index :badge_awardings, :member_id
  end

  def self.down
    drop_table :badge_awardings
    drop_table :badges
  end
end