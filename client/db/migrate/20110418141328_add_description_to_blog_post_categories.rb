class AddDescriptionToBlogPostCategories < ActiveRecord::Migration
  def self.up
    add_column :blog_post_categories, :description, :text
  end

  def self.down
    remove_column :blog_post_categories, :description
  end
end
