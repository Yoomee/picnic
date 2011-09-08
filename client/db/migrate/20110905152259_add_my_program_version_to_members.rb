class AddMyProgramVersionToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :my_program_version, :integer, :default => 1
  end

  def self.down
    remove_column :members, :my_program_version
  end
end
