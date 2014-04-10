require File.dirname(__FILE__) + '/../../../../../test/test_helper'

class ContentFilterWordTest < ActiveSupport::TestCase

  subject {Factory.create(:content_filter_word)}

  should have_db_column(:word)
  should have_db_column(:whitelist)
  
  should validate_presence_of(:word)
  should validate_uniqueness_of(:word)
  
  context "a valid instance" do
    
    setup do
      @content_filter_word = Factory.build(:content_filter_word)
    end
    
    should "be valid?" do
      assert @content_filter_word.valid?
    end
    
    should "save" do
      assert @content_filter_word.save
    end

  end
  
  context "a saved instance" do
    
    setup do
      @content_filter_word = Factory.create(:content_filter_word)
      TramlinesContentFilter::flush_words!
    end
    
    should "be valid after saving" do
      assert @content_filter_word.valid?
    end
    
  end
  
end
