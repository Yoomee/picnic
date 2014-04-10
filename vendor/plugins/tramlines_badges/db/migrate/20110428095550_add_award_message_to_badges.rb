class AddAwardMessageToBadges < ActiveRecord::Migration
  def self.up
    add_column :badges, :award_message, :text
  end

  def self.down
    remove_column :badges, :award_message
  end
end
