class CreateUrls < ActiveRecord::Migration
  def self.up
    create_table :urls do |t|
      t.text :url
      t.string :host
      t.integer :attachable_id
      t.string :attachable_type
      t.timestamps
    end
  end

  def self.down
    drop_table :urls    
  end
end
