require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class AdvertTest < ActiveSupport::TestCase

  should belong_to(:campaign)

  should have_db_column(:name)
  should have_db_column(:url)
  should have_db_column(:image_uid)  
  should have_db_column(:impression_count).of_type(:integer)
  should have_db_column(:max_impression_count).of_type(:integer)
  should have_db_column(:click_count).of_type(:integer)
  should have_db_column(:max_click_count).of_type(:integer)
  should have_db_column(:active_from).of_type(:datetime)
  should have_db_column(:active_until).of_type(:datetime)
  should have_db_column(:campaign_id)
    
  should validate_presence_of(:name)
  should validate_presence_of(:campaign)
  should validate_presence_of(:url)
  should validate_presence_of(:image)
  should validate_numericality_of(:impression_count)
  should validate_numericality_of(:max_impression_count)
  should validate_numericality_of(:click_count)
  should validate_numericality_of(:max_click_count)
  
  context "a valid instance" do
    
    should "be valid" do
      @advert = Factory.build(:advert)
      assert @advert.valid?
    end
    
  end
  
  context "when validating active_from and active_until" do
    
    setup do
      @advert = Factory.build(:advert)
    end
    
    should "be valid if they are both nil" do
      @advert.active_from = nil
      @advert.active_until = nil
      assert @advert.valid?
    end
    
    should "be valid if active_from is before active_until" do
      @advert.active_from = 1.day.ago
      @advert.active_until = 1.day.from_now      
      assert @advert.valid?
    end
    
    should "be invalid if active_from is equal to active_until" do
      @advert.active_from = 1.day.ago
      @advert.active_until = @advert.active_from
      assert !@advert.valid?
    end
    
    should "be invalid if active_from is after active_until" do
      @advert.active_from = 1.day.from_now
      @advert.active_until = 1.day.ago
      assert !@advert.valid?
    end
    
    should "set the correct error message if invalid" do
      @advert.active_from = 1.day.from_now
      @advert.active_until = 1.day.ago
      @advert.valid?
      assert_equal "The start date must be before the end date.", @advert.errors.on(:base)
    end
    
  end  

  context "on call to active?" do
    
    setup do
      @advert = Factory.build(:advert)      
    end    
    
    should "return true if active dates, max impression count and max click count are blank" do
      assert @advert.active?
    end
    
    should "return true if inside active dates and max impression count and max click count are blank" do
      @advert.active_from = 1.day.ago
      @advert.active_until = 1.day.from_now
      assert @advert.active?
    end
    
    should "return true if under max impression count and active dates and max click count are blank" do
      @advert.max_impression_count = 10
      @advert.impression_count = 5
      assert @advert.active?
    end
    
    should "return true if under max click count and active dates and max impression count are blank" do
      @advert.max_click_count = 10
      @advert.click_count = 5
      assert @advert.active?
    end
    
    should "return false if outside active dates" do
      @advert.active_from = 2.days.ago
      @advert.active_until = 1.day.ago
      assert !@advert.active?
    end
    
    should "return false if over max impression count" do
      @advert.max_impression_count = 10
      @advert.impression_count = 11
      assert !@advert.active?
    end
    
    should "return false if over max click count" do
      @advert.max_click_count = 10
      @advert.click_count = 11
      assert !@advert.active?
    end
    
  end
  
  context "setting the url" do
    
    setup do
      @advert = Factory.build(:advert)
    end
    
    should "add http:// if needed" do
      @advert.url = "yoomee.com"
      assert_equal "http://yoomee.com", @advert.url
    end
    
    should "not add http:// if begins with http:///" do
      @advert.url = "http://yoomee.com"
      assert_equal "http://yoomee.com", @advert.url      
    end

    should "not add http:// if begins with https:///" do
      @advert.url = "https://yoomee.com"
      assert_equal "https://yoomee.com", @advert.url
    end
    
  end
  
end