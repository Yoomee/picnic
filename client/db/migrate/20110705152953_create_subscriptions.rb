class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.belongs_to :member
      t.belongs_to :attachable, :polymorphic => true
      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
