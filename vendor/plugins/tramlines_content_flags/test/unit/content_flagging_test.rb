require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class ContentFlaggingTest < ActiveSupport::TestCase

  should have_db_column(:content_flag_id)
  should have_db_column(:content_flag_type_id)
  should have_db_column(:created_at)
  should have_db_column(:email)
  should have_db_column(:flagged_by_human).of_type(:boolean)
  should have_db_column(:member_id)
  should have_db_column(:message)
  should have_db_column(:updated_at)

  should belong_to(:content_flag)
  should belong_to(:content_flag_type)
  should belong_to(:member)
    
  context "a valid instance" do
    
    setup do
      @content_flagging = Factory.build(:content_flagging)
    end
    
    should "be_valid" do
      assert_valid @content_flagging
    end
    
  end
  
  context "an instance" do
    
    setup do
      @content_flagging = Factory.build(:content_flagging)
    end
    
    should "be valid if comment is blank" do
      @content_flagging.comment = ""
      assert_valid @content_flagging
    end
    
    should "be valid if comment is nil" do
      @content_flagging.comment = nil
      assert_valid @content_flagging
    end
    
    should "be invalid if comment is not blank" do
      @content_flagging.comment = "spam"
      assert !@content_flagging.valid?
    end
    
  end
  
  context "content is flagged by content filter" do

    setup do
      Factory.create(:content_filter_word)
      TramlinesContentFilter::flush_words!
      @member = Factory.create(:member, :forename => "fudge", :bio => "What the fudge?!", :acknowledged_failed_content_filter => true, :username => 'fudge')
      @content_flag = ContentFlag.find_by_attachable_id_and_attachable_type(@member.id, "Member")
    end
    
    should "create content flag" do
      assert @content_flag.content_flaggings.count > 0
    end
    
    should "create content flag fields" do
      # A filtered and unfiltered version for each of the relevant fields
      assert_equal 4, @content_flag.content_flag_fields.size
    end
    
  end
    
    
  context "content is flagged by human" do

    setup do
      @member = Factory.create(:member, :bio => "I'm nice.", :acknowledged_failed_content_filter => true)
      @content_flag = Factory.create(:content_flag, :attachable => @member)
      @content_flagging = Factory.create(:content_flagging, :content_flag => @content_flag, :flagged_by_human => true)
    end
    
    should "create content flag fields for all filtered attributes" do
      assert_equal @content_flag.content_flag_fields.size, Member.filtered_attributes.size
    end
    
  end

end

