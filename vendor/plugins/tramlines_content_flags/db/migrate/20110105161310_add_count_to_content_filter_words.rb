class AddCountToContentFilterWords < ActiveRecord::Migration
  def self.up
    add_column :content_filter_words, :count, :integer, :default => 0
  end

  def self.down
    remove_column :content_filter_words, :count
  end
end
