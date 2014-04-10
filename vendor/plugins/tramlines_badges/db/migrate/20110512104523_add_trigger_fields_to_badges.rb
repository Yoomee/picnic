class AddTriggerFieldsToBadges < ActiveRecord::Migration
  def self.up
    add_column :badges, :trigger_name, :string
    add_column :badges, :trigger_num, :integer
  end

  def self.down
    remove_column :badges, :trigger_num
    remove_column :badges, :trigger_name
  end
end
