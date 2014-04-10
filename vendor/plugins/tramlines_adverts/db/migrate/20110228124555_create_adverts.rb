class CreateAdverts < ActiveRecord::Migration
  def self.up
    create_table :adverts do |t|
      t.string :name
      t.string :url
      t.string :image_uid
      t.integer :impression_count, :default => 0
      t.integer :max_impression_count
      t.integer :click_count, :default => 0
      t.integer :max_click_count
      t.datetime :active_from
      t.datetime :active_until
      t.integer :campaign_id
      t.timestamps
    end
  end

  def self.down
    drop_table :adverts
  end
end
