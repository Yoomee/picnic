namespace :content_filter do
  namespace :dictionary do
    desc "Delete all content filter words and replace with contents of dictionary.txt"
    task :reload => :environment do
      ContentFilterWord.destroy_all
      File.readlines(File.dirname(__FILE__) + '/../lib/dictionary.txt').each do |word|
        ContentFilterWord.create(:word => word.chomp.strip)
      end
    end
  end
end