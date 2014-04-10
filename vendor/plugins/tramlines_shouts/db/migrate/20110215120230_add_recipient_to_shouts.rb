class AddRecipientToShouts < ActiveRecord::Migration
  
  def self.up
    add_column :shouts, :recipient_type, :string
    add_column :shouts, :recipient_id, :integer
  end

  def self.down
    remove_column :shouts, :recipient_type
    remove_column :shouts, :recipient_id
  end
  
end
