class AddEvpIdToConferenceDelegates < ActiveRecord::Migration
  def self.up
    add_column :conference_delegates, :evp_id, :integer
  end

  def self.down
    remove_column :conference_delegates, :evp_id
  end
end
