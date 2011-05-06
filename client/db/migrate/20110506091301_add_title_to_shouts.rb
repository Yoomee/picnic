class AddTitleToShouts < ActiveRecord::Migration
  def self.up
    add_column :shouts, :title, :string
  end

  def self.down
    remove_column :shouts, :title
  end
end
