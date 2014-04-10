class AddWhitelistToContentFilterWords < ActiveRecord::Migration
  def self.up
    add_column :content_filter_words, :whitelist, :boolean, :default => false
    add_index :content_filter_words, :whitelist
  end

  def self.down
    remove_column :content_filter_words, :whitelist
  end
end
