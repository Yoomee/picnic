class AddTimestampsToMessageRecipients < ActiveRecord::Migration
  
  def self.up
    add_timestamps(:message_recipients)
  end

  def self.down
    remove_timestamps(:message_recipients)
  end
  
end
