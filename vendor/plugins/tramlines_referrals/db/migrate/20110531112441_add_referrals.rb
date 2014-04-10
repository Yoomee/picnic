class AddReferrals < ActiveRecord::Migration
  
  def self.up
    create_table :referrals do |t|
      t.integer :member_id
      t.string :code
      t.timestamps
    end
  end

  def self.down
    drop_table :referrals
  end
  
end
