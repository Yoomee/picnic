require File.dirname(__FILE__) + '/../../../test/test_helper'
class FrontCoverTest < ActiveSupport::TestCase

  subject {Factory.create(:front_cover)}
  
  should have_db_column(:activated).of_type(:boolean).with_options(:default => false)
  should have_db_column(:created_at).of_type(:datetime)
  should have_db_column(:image_uid).of_type(:string)
  should have_db_column(:main_story_link_text).of_type(:string).with_options(:default => 'More')
  should have_db_column(:main_story_link_url).of_type(:string)
  should have_db_column(:main_story_small_heading).of_type(:string)
  should have_db_column(:main_story_subtitle).of_type(:string)
  should have_db_column(:main_story_text).of_type(:text)
  should have_db_column(:main_story_title).of_type(:string)
  should have_db_column(:name).of_type(:string)
  should have_db_column(:small_story1_link_text).of_type(:string).with_options(:default => 'More')
  should have_db_column(:small_story1_link_url).of_type(:string)
  should have_db_column(:small_story1_text).of_type(:text)
  should have_db_column(:small_story1_title).of_type(:string)
  should have_db_column(:small_story2_link_text).of_type(:string).with_options(:default => 'More')
  should have_db_column(:small_story2_link_url).of_type(:string)
  should have_db_column(:small_story2_text).of_type(:text)
  should have_db_column(:small_story2_title).of_type(:string)
  should have_db_column(:small_story3_link_text).of_type(:string).with_options(:default => 'More')
  should have_db_column(:small_story3_link_url).of_type(:string)
  should have_db_column(:small_story3_text).of_type(:text)
  should have_db_column(:small_story3_title).of_type(:string)
  should have_db_column(:updated_at).of_type(:datetime)

  should validate_presence_of(:main_story_link_text)
  should validate_presence_of(:main_story_link_url)
  should validate_presence_of(:main_story_text)
  should validate_presence_of(:main_story_title)
  should validate_presence_of(:name)
  should validate_presence_of(:small_story1_link_text)
  should validate_presence_of(:small_story1_link_url)
  should validate_presence_of(:small_story1_text)
  should validate_presence_of(:small_story1_title)
  should validate_presence_of(:small_story2_link_text)
  should validate_presence_of(:small_story2_link_url)
  should validate_presence_of(:small_story2_text)
  should validate_presence_of(:small_story2_title)
  should validate_presence_of(:small_story3_link_text)
  should validate_presence_of(:small_story3_link_url)
  should validate_presence_of(:small_story3_text)
  should validate_presence_of(:small_story3_title)

  should validate_uniqueness_of(:name)

  context "class on call to active" do
    
    should "not return an unactivated front cover" do
      front_cover = Factory.create(:front_cover, :activated => false)
      assert_does_not_contain FrontCover.active, front_cover
    end
    
    should "return an activated front cover" do
      front_cover = Factory.create(:front_cover, :activated => true)
      assert_contains FrontCover.active, front_cover
    end
    
  end
  
  context "on call to activated=(false) when saving" do
    
    setup do
      @front_cover1 = Factory.create(:front_cover, :activated => true)
      @front_cover2 = Factory.create(:front_cover)
      FrontCover.stubs(:active).returns [@front_cover1]
    end
    
    should "not reset activated to false on the other front_covers" do
      @front_cover1.expects(:update_attribute).never
      @front_cover2.activated = false
      @front_cover2.save!
    end
    
  end
  
  context "on call to activated=(true) when not saving" do
    
    setup do
      @front_cover1 = Factory.build(:front_cover, :activated => true)
      @front_cover2 = Factory.build(:front_cover)
      FrontCover.stubs(:active).returns [@front_cover1]
    end
    
    should "reset activated to false on the other front covers" do
      @front_cover1.expects(:update_attribute).never
      @front_cover2.activated = true
    end
  
  end
  
  context "on call to activated=(true) when saving" do
    
    setup do
      @front_cover1 = Factory.build(:front_cover, :activated => true)
      @front_cover2 = Factory.build(:front_cover)
      FrontCover.stubs(:active).returns [@front_cover1]
    end
    
    should "reset activated to false on the other front covers" do
      @front_cover1.expects(:update_attribute).with(:activated, false)
      @front_cover2.activated = true
      @front_cover2.save!
    end
  
  end

end

