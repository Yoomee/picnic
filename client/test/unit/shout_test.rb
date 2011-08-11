require File.dirname(__FILE__) + '/../../../test/test_helper'
class ShoutTest < ActiveSupport::TestCase
  
  should have_db_column(:title).of_type(:string)
  
  context "concerning points_events" do
    
    setup do
      @member = Factory.create(:member)
      @member.update_attribute(:points, 0)
      @points_event = Factory.create(:points_event, :slug => "post_shout", :points => 5)
      @shout = Factory.create(:shout, :member => @member)
    end
    
    context "after create" do
    
      should "create points_transfer for the points_event :post_shout" do
        assert @member.points_transfers.exists?(:attachable_id => @shout.id, :points => 5)
      end
      
      should "add points to member" do
        assert_equal 5, @member.points
      end
      
    end
    
    context "after destroy" do
    
      should "destroy points_transfer" do
        @shout.destroy
        assert !@member.points_transfers.exists?(:attachable_id => @shout.id)
      end
      
      should "deduct points from member" do
        @shout.destroy
        assert_equal 0, @member.points
      end
      
    end
    
  end
  
end