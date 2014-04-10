require File.dirname(__FILE__) + '/../../../../../test/test_helper'

class MessageTest < ActiveSupport::TestCase

  should belong_to(:member)
  should belong_to(:parent)
  should have_many(:children)
  should have_many(:recipients)
  
  should validate_presence_of(:member)
  
  context "a valid instance" do
    
    setup do
      @message = Factory.build(:message)
    end
    
    should "be_valid" do
      assert_valid @message
    end
    
  end
  
  context "saving with duplicate recipients" do
    
    setup do
      @member = Factory.create(:member)
      @message = Factory.create(:message, :recipients => [@member, @member])
    end
    
    should "remove duplicates" do
      assert_equal [@member.id], @message.recipient_ids
    end
    
  end
  
end
