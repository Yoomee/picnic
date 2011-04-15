class AddingIsProjectToBlogPostCategories < ActiveRecord::Migration

  def self.up
    add_column :blog_post_categories, :is_project, :boolean, :default => false
  end

  def self.down
    remove_column :blog_post_categories, :is_project
  end
  
end
