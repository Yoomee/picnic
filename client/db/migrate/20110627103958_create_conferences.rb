class CreateConferences < ActiveRecord::Migration
  def self.up
    create_table :conferences do |t|
      t.string :name
      t.text :description
      t.string :image_uid
      t.date :starts_on
      t.date :ends_on
      t.timestamps
    end
  end

  def self.down
    drop_table :conferences
  end
end