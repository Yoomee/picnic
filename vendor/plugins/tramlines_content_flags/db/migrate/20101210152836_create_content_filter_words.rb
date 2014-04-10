class CreateContentFilterWords < ActiveRecord::Migration
  def self.up
    create_table :content_filter_words do |t|
      t.string :word
    end
    File.readlines(File.dirname(__FILE__) + '/../../lib/dictionary.txt').each do |word|
      ContentFilterWord.create(:word => word.chop.strip)
    end
  end

  def self.down
    drop_table :content_filter_words
  end
end
