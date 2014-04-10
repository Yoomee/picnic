require File.dirname(__FILE__) + '/../../../../../test/test_helper'

class MemberTest < ActiveSupport::TestCase

  context "on call to content_filter" do
    
    setup do
      Member.content_filter(:forename, :surname, :bio)
    end
    
    should "include module TramlinesContentFilter" do
      assert Member.included_modules.include?(TramlinesContentFilter)
    end
    
    should "add attributes to unfiltered_attributes" do
      assert Member.filtered_attributes, [:forename, :surname, :bio]
    end
    
  end

  context "tramlines content filter" do
    
    setup do
      @member = Factory.build(:member)
      Factory.create(:content_filter_word)
    end
    
    should "filter out profanities" do
      @member.bio = "This bio contains the word fudge, oh no!"
      @member.save
      assert !@member.valid? #&& @member.content_filter_errors.invalid?(:bio)
    end
    
    should "not filter skipped attributes" do
      @member.email = "fudge@email.com"
      @member.save
      assert !@member.content_filter_errors.invalid?(:email)
    end
    
    context "with acknowledged failure" do
      
      setup do
        @member.bio = "This bio contains the word fudge, oh no!"
        @member.acknowledged_failed_content_filter = true
        @member.save
      end
    
      should "be valid despite profanitites" do
        assert @member.valid?
      end
    
      should "replace vowels of profanities with stars" do
        assert_equal @member.bio, "This bio contains the word f*dg*, oh no!"
      end
    
      should "create a content flag when saved" do
        assert !ContentFlag.first.nil?
        assert_equal ContentFlag.first.attachable, @member
      end
      
    
    end
    
  end

end
