class AddFieldsToConferenceSession < ActiveRecord::Migration
  def self.up
    add_column :conference_sessions, :conference_id, :integer
    add_column :conference_sessions, :image_uid, :string
    
    add_index :conference_sessions, :conference_id
  end

  def self.down
    remove_column :conference_sessions, :conference_id
    remove_column :conference_sessions, :image_uid
  end
end
