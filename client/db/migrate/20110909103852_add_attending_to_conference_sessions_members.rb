class AddAttendingToConferenceSessionsMembers < ActiveRecord::Migration
  def self.up
    add_column :conference_sessions_members, :attending, :boolean, :default => true
  end

  def self.down
    remove_column :conference_sessions_members, :attending
  end
end
