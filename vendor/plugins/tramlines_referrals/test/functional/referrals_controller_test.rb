require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class ReferralsControllerTest < ActionController::TestCase
  
  should have_action(:new).with_level(:member_only)
  should have_action(:contacts).with_level(:member_only)
  should have_action(:fetch_contacts).with_level(:member_only)
  should have_action(:update).with_level(:member_only)
  should have_action(:show).with_level(:open)
  
  context "new" do
    
    context "GET" do
      
      setup do
        expect_logged_in_member
        get :new
      end
      
      should render_template(:new)
      
    end
    
  end
  
end