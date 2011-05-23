require File.dirname(__FILE__) + '/../../../test/test_helper'
class TagTest < ActiveSupport::TestCase
  
  should have_db_column(:description).of_type(:text)
  should have_db_column(:image_uid).of_type(:string)
  
  context "on call to named_scope top_tags" do
  
    setup do
      @shout2 = Factory.create(:shout, :tag_list => ["tag2"])      
      @shout1 = Factory.create(:shout, :tag_list => ["tag1"])
      Factory.create(:wall_post, :wall => @shout1.wall)
    end
  
    should "return members in correct order" do
      assert_equal ["tag1", "tag2"], Tag.top_tags.collect(&:name)
    end
  
  end
  
end