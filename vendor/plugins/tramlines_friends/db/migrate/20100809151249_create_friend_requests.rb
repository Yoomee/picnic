class CreateFriendRequests < ActiveRecord::Migration
  
  def self.up
    create_table :friend_requests do |t|
      t.column :member_id, :integer
      t.column :member_id_target, :integer
      t.column :message, :text
      t.column :is_accepted, :boolean, :default => false
      t.column :accepted_at, :timestamp
    end
  end

  def self.down
    drop_table :friend_requests
  end
  
end
