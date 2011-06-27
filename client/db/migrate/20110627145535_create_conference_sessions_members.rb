class CreateConferenceSessionsMembers < ActiveRecord::Migration
  def self.up
    create_table :conference_sessions_members do |t|
      t.integer :conference_session_id
      t.integer :member_id
      t.timestamps
    end
    add_index :conference_sessions_members, :conference_session_id
  end

  def self.down
    drop_table :conference_sessions_members    
  end
end
