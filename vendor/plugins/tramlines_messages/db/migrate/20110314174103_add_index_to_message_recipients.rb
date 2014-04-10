class AddIndexToMessageRecipients < ActiveRecord::Migration
  def self.up
    add_index :message_recipients, [:member_id, :message_id], :unique => true
  end

  def self.down
    remove_index :message_recipients, :column => [:member_id, :message_id]
  end
end
