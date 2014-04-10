require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class BadgeTest < ActiveSupport::TestCase

  subject {Factory.create(:badge)}

  should have_db_column(:ref)
  should have_db_column(:name)
  should have_db_column(:description)  
  should have_db_column(:award_message)
  should have_db_column(:image_uid)
  should have_db_column(:trigger_name).of_type(:string)
  should have_db_column(:trigger_num).of_type(:integer)
  
  should validate_presence_of(:ref)
  should validate_presence_of(:name)
  should validate_presence_of(:description)
  #should validate_presence_of(:image)
  should validate_uniqueness_of(:ref)
  should validate_uniqueness_of(:name)
  should validate_numericality_of(:trigger_num)
  
  should have_many(:badge_awardings)
  should have_many(:members)
  
  context "a valid instance" do
    
    setup do 
      @badge = Factory.build(:badge)
    end
    
    should "be valid" do
      assert @badge.valid?
    end
    
  end
  
  context "when validating badge" do
    
    setup do
      @badge = Factory.build(:badge, :has_trigger => true)
    end
    
    should "be invalid if has_trigger is true but trigger_num is blank" do
      @badge.valid?
      assert @badge.errors.invalid?(:trigger_num)
    end
    
    should "be invalid if has_trigger is true but trigger_name is blank" do
      @badge.valid?
      assert @badge.errors.invalid?(:trigger_name)
    end
    
  end
  
end