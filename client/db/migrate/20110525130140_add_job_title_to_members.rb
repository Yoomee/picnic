class AddJobTitleToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :job_title, :string
  end

  def self.down
    remove_column :members, :job_title
  end
end
