class AddFrontCovers < ActiveRecord::Migration
  
  def self.up
    create_table :front_covers do |t|
      t.string :name
      t.string :main_story_title
      t.string :main_story_small_heading
      t.string :main_story_subtitle
      t.text :main_story_text
      t.string :main_story_link_text, :default => 'More'
      t.string :main_story_link_url
      t.string :small_story1_title
      t.text :small_story1_text
      t.string :small_story1_link_text, :default => 'More'
      t.string :small_story1_link_url
      t.string :small_story2_title
      t.text :small_story2_text
      t.string :small_story2_link_text, :default => 'More'
      t.string :small_story2_link_url
      t.string :small_story3_title
      t.text :small_story3_text
      t.string :small_story3_link_text, :default => 'More'
      t.string :small_story3_link_url
      t.timestamps
    end
  end

  def self.down
    drop_table :front_covers
  end
  
end
