class CreatePointsTransfers < ActiveRecord::Migration
  def self.up
    create_table :points_transfers do |t|
      t.belongs_to :member
      t.integer :points
      t.string :points_event_slug
      t.belongs_to :attachable, :polymorphic => true
      t.timestamps
    end
    add_index :points_transfers, :member_id
  end

  def self.down
    drop_table :points_transfers
  end
end
