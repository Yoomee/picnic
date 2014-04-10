class CreateMessageRecipients < ActiveRecord::Migration
  
  def self.up
    create_table :message_recipients do |t|
      t.integer :member_id
      t.integer :message_id
      t.boolean :read, :default => false
      t.boolean :deleted, :default => false
    end
  end

  def self.down
    drop_table :message_recipients
  end
  
end
