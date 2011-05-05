class CreateConferenceSessions < ActiveRecord::Migration
  def self.up
    create_table :conference_sessions do |t|
      t.string :name
      t.belongs_to :venue
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.timestamps
    end
    add_index :conference_sessions, :venue_id
  end

  def self.down
    drop_table :conference_sessions
  end
end
