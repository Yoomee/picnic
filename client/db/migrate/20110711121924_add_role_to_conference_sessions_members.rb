class AddRoleToConferenceSessionsMembers < ActiveRecord::Migration
  def self.up
    add_column :conference_sessions_members, :speaker, :boolean, :default => false
  end

  def self.down
    remove_column :conference_sessions_members, :speaker
  end
end
