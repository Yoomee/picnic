require File.dirname(__FILE__) + '/../../../test/test_helper'
class UrlTest < ActiveSupport::TestCase
  
  should have_db_column(:url).of_type(:text)
  should have_db_column(:host).of_type(:string)
  should have_db_column(:attachable_id).of_type(:integer)
  should have_db_column(:attachable_type).of_type(:string)
  should have_timestamps
  
  
  context "a valid instance" do
    
    setup do
      @url = Factory.build(:url)
    end
    
    should "be valid" do
      assert_valid @url
    end
    
  end
  
  
end