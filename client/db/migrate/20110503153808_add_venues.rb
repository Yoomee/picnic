class AddVenues < ActiveRecord::Migration
  
  def self.up
    create_table :venues do |t|
      t.string :name
    end
    add_column :events, :venue_id, :integer
  end

  def self.down
    drop_table :venues
    remove_column :events, :venue_id
  end
  
end
