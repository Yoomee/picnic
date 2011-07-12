require File.dirname(__FILE__) + '/../../../test/test_helper'
class MemberTest < ActiveSupport::TestCase
  
  should have_many(:subscriptions).dependent(:destroy)
  should have_many(:subscription_items).dependent(:destroy)  
  should have_many(:subscribers).through(:subscription_items)
  
  context "on call to class method subscribed_to_tags" do
    
    setup do
      @tag1 = Factory.create(:tag, :name => "tag1")
      @tag2 = Factory.create(:tag, :name => "tag2")
      @tag3 = Factory.create(:tag, :name => "tag3")
      @member1 = Factory.create(:member, :id => 1)
      @member2 = Factory.create(:member, :id => 2)
      Factory.create(:subscription, :member => @member1, :attachable => @tag1)
      Factory.create(:subscription, :member => @member1, :attachable => @tag2)
      Factory.create(:subscription, :member => @member2, :attachable => @tag3)
    end
    
    should "return members subscribed to tags" do
      assert_equal [1], Member.subscribed_to_tags([@tag1, @tag2]).collect(&:id)
    end
    
  end
  
end