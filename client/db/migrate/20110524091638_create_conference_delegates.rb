class CreateConferenceDelegates < ActiveRecord::Migration
  def self.up
    create_table :conference_delegates do |t|
      t.integer :member_id
      t.date    :regdate
      t.boolean :present
      t.string  :delegate_type
      t.string  :promo
      t.string  :firstname
      t.string  :lastname
      t.string  :gender
      t.string  :organisation
      t.string  :branch
      t.string  :function
      t.string  :email
      t.string  :twitter
      t.boolean :ticket_wed  
      t.boolean :ticket_thu  
      t.boolean :ticket_fri
      t.boolean :ticket_3
      t.boolean :dinner_wed
      t.boolean :dinner_thu
      t.string :signature
      t.timestamps
    end
  end

  def self.down
    drop_table :conference_delegates
  end
end



















