class CreateMessages < ActiveRecord::Migration
  
  def self.up
    create_table :messages do |t|
      t.integer :member_id
      t.string :subject
      t.text :text
      t.integer :parent_id
      t.boolean :deleted, :default => false
      t.timestamps
    end
  end
  
  def self.down
    drop_table :messages
  end
  
end
