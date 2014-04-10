class AddEmailFieldsToMembers < ActiveRecord::Migration
  def self.up
    add_column :members, :email_for_profile_shouts, :boolean, :default => true    
    add_column :members, :email_for_my_shouts, :boolean, :default => true
    add_column :members, :email_for_my_comments, :boolean, :default => true
  end

  def self.down
    remove_column :members, :email_for_my_comments
    remove_column :members, :email_for_my_shouts
    remove_column :members, :email_for_profile_shouts
  end
end
