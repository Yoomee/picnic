class AddMainStoryBackgroundColor < ActiveRecord::Migration
  
  def self.up
    add_column :front_covers, :main_story_background_color, :string
  end

  def self.down
    remove_column :front_covers, :main_story_background_color
  end
  
end
