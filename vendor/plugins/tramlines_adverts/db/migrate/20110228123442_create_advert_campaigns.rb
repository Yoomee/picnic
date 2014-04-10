class CreateAdvertCampaigns < ActiveRecord::Migration
  def self.up
    create_table :advert_campaigns do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :advert_campaigns
  end
end
