class CreatePointsEvents < ActiveRecord::Migration
  def self.up
    create_table :points_events do |t|
      t.string :slug
      t.string :name
      t.integer :points
      t.timestamps
    end
    remove_column :points_transfers, :points_event_slug
    add_column :points_transfers, :points_event_id, :integer
  end

  def self.down
    remove_column :points_transfers, :points_event_id
    add_column :points_transfers, :points_event_slug, :string
    drop_table :points_events
  end
end
