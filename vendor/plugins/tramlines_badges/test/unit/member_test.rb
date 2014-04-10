require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class MemberTest < ActiveSupport::TestCase

  should have_many(:badge_awardings)
  should have_many(:badges)
  should have_db_column(:points).of_type(:integer)
  should have_many(:points_transfers)
  
  context "on call to has_badge?" do
    setup do
      @member = Factory.create(:member)
      @badge = Factory.create(:badge, :name => "Badge 1")
    end
    
    should "return false if member doesn't have badge" do
      assert !@member.has_badge?(@badge)
    end
    
    should "return false if member doesn't have badge using ref" do
      assert !@member.has_badge?("badge_1")
    end
    
    should "return true if member has badge" do
      @member.badges << @badge
      assert @member.has_badge?(@badge)
    end
    
    should "return true if member has badge using ref" do
      @member.badges << @badge
      assert @member.has_badge?("badge_1")
    end
    
  end
  
  context "on call to with_badge" do
    
    setup do
      @member1 = Factory.create(:member, :id => 1)
      @member2 = Factory.create(:member, :id => 2)
      @member1.badges << Factory.create(:badge, :name => "Badge 1")
    end
    
    should "return members with the badge" do
      assert_equal Member.with_badge("badge_1").collect(&:id), [1]
    end
    
  end
  
  context "on call to handle_points_event" do
    
    setup do
      @member = Factory.build(:member, :points => 0)
      @member.stubs(:trigger_points_event).returns(true)
      @points_event = Factory.build(:points_event, :slug => "test_slug", :points => 10, :name => "Test points", :id => 1)
      PointsEvent.expects(:find_by_slug).with("test_slug").returns(@points_event)
      @member.handle_points_event("test_slug", @member)
    end
    
    should "add correct number of points" do
      assert_equal @member.points, 10
    end
        
    should "create a points_transfer" do
      assert @member.points_transfers.exists?(:points => 10, :points_event_id => 1)
    end
    
  end
  
  context "on call to named_scope ranked_since" do
    
    setup do
      @points_event = Factory.create(:points_event, :slug => "test_slug")
      @member1 = Factory.create(:member, :id => 1, :points => 20)
      @member2 = Factory.create(:member, :id => 2, :points => 10)
      @member1.points_transfers.create(:points => 10, :created_at => 31.days.ago, :points_event => @points_event)
      @member1.points_transfers.create(:points => 5, :created_at => 1.day.ago, :points_event => @points_event)
      2.times {@member2.points_transfers.create(:points => 5, :created_at => 1.day.ago, :points_event => @points_event)}
    end
    
    should "return members in correct order" do
      assert_equal [2,1], Member.ranked_since(30.days.ago).collect(&:id)
    end
        
  end
  
  context "on call to handle_badge_trigger" do
    
    setup do
      @member = Factory.create(:member)
      @badge = Factory.create(:badge, :trigger_name => "test_trigger", :trigger_num => 10, :id => 1)
    end
    
    should "award badge if trigger_num is reached" do
      @member.expects(:amount_for_badge_trigger).returns(10)
      @member.handle_badge_trigger(:test_trigger)
      assert @member.badges.exists?(:id => 1)
    end
    
    should "not award badge if trigger_num is not reached" do
      badges = Badge.for_trigger("test_trigger", 5)
      @member.expects(:amount_for_badge_trigger).returns(5)
      @member.handle_badge_trigger(:test_trigger)
      assert @member.badges.empty?
    end
    
  end
  
end