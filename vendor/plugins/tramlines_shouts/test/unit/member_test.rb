require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class MemberTest < ActiveSupport::TestCase

  should have_db_column(:email_for_profile_shouts).of_type(:boolean)
  should have_db_column(:email_for_my_shouts).of_type(:boolean)  
  should have_db_column(:email_for_my_comments).of_type(:boolean)

  context "on call to named_scope top_posters" do
    
    setup do
      @member2 = Factory.create(:member, :id => 2)      
      @member3 = Factory.create(:member, :id => 3)      
      @member1 = Factory.create(:member, :id => 1)
      @shout1 = Factory.create(:shout, :member => @member1)
      @shout2 = Factory.create(:shout, :member => @member2)
      Factory.create(:wall_post, :wall => @shout1.wall, :member => @member1)      
    end
    
    should "return members in correct order" do
      assert_equal [1,2], Member.top_posters.collect(&:id)
    end
    
  end

  context "on call to named_scope top_posters_since" do
    
    setup do
      @member2 = Factory.create(:member, :id => 2)
      @member1 = Factory.create(:member, :id => 1)
      @shout1 = Factory.create(:shout, :member => @member1, :created_at => 31.days.ago)
      Factory.create(:wall_post, :wall => @shout1.wall, :member => @member1, :created_at => 31.days.ago)
      Factory.create(:wall_post, :wall => @shout1.wall, :member => @member2, :created_at => 1.day.ago)
    end
    
    should "return members in correct order" do
      assert_equal [2], Member.top_posters_since(30.days.ago).collect(&:id)
    end
    
  end

end
