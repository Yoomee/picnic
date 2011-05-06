class AddTagLineToAdverts < ActiveRecord::Migration
  
  def self.up
    add_column :adverts, :tag_line, :text
  end

  def self.down
    remove_column :adverts, :tag_line
  end
  
end
