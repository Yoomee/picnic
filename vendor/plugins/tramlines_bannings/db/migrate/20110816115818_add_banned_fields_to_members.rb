class AddBannedFieldsToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :banned_at, :datetime
    add_column :members, :banned_by_id, :integer
    add_column :members, :banned_message, :text
  end

  def self.down
    remove_column :members, :banned_message
    remove_column :members, :banned_by_id
    remove_column :members, :banned_at
  end
end
