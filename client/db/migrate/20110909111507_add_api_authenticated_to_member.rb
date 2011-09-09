class AddApiAuthenticatedToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :api_authenticated, :boolean
  end

  def self.down
    remove_column :members, :api_authenticated
  end
end
