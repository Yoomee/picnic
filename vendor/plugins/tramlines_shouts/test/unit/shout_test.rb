require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class ShoutTest < ActiveSupport::TestCase
  
  should belong_to(:member)
  should belong_to(:attachable)
  
  should have_db_column(:text)

  context "a valid instance" do
    
    setup do
      @shout = Factory.build(:shout)
    end
    
    should "be valid" do
      assert @shout.valid?
    end
    
  end

  context "on call to notify_recipient" do
    
    setup do
      @author = Factory.create(:member)
      @shout = Factory.build(:shout, :member => @author)
    end
    
    should "not send notification if recipient is not a member" do
      @shout.save
      assert Notification.count.zero?
    end
    
    should "not send notification if recipient is the author of the shout" do
      @shout.recipient = @author
      @shout.save
      assert Notification.count.zero?
    end
    
    should "send notification to recipient" do
      @recipient = Factory.create(:member)
      @shout.recipient = @recipient
      @shout.save
      assert @recipient.notifications.count == 1
    end
    
  end
  
end
