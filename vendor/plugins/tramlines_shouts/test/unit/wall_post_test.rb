require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class WallPostTest < ActiveSupport::TestCase
  
  should have_and_belong_to_many(:notifications)
  
  context "after destroy" do
    
    setup do
      @wall_post1 = Factory.create(:wall_post, :id => 1)
      @wall_post2 = Factory.create(:wall_post, :id => 2)
      @notification1 = Factory.create(:notification, :wall_posts => [@wall_post1], :id => 1)
      @notification2 = Factory.create(:notification, :wall_posts => [@wall_post1, @wall_post2], :id => 2)
      @wall_post1.destroy      
    end
    
    should "destroy notifications that relate to only this comment" do
      assert !Notification.exists?(1) && Notification.exists?(2)
    end
    
    should "remove it's association with notifications that relate to other comments as well" do
      assert !@notification2.wall_posts.exists?(1) && @notification2.wall_posts.exists?(2)
    end
    
  end
  
end
