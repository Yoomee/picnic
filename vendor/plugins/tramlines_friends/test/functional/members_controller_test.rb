require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class MembersControllerTest < ActionController::TestCase

  context "friend_only action for non-friends" do
    
    setup do
      @old_permission = MembersController.permission_level(:show)
      MembersController.friend_only(:show)
      @member = Factory.build(:member, :id => 1234)
      Member.stubs(:find).returns @member
      @not_friend = Factory.build(:member, :id => 456)
      @not_friend.stubs(:friends).returns [Factory.build(:member, :id => 1235)]
      Member.stubs(:find).with {|*args| args.first == :all}.returns [@member, @not_friend]
      @controller.stubs(:find_logged_in_member).returns @not_friend
      stub_finds(Section)
    end
    
    teardown do
      MembersController.send(:set_permission_level, :show, @old_permission)
    end
    
    context "GET" do
      
      setup do
        get :show, :id => 123
      end
      
      before_should "find the logged-in member" do
        @controller.expects(:find_logged_in_member).returns @not_friend
      end
      
      before_should "find the member" do
        Member.expects(:find).with(123).returns @member
      end
      
      before_should "check the logged-in member's friends" do
        @not_friend.expects(:friends).returns [Factory.build(:member)]
      end
      
      before_should "not allow permission" do
        # Stub render as render_not_allowed_message expectation will cause rendering of show view otherwise
        @controller.stubs(:render).returns true
        @controller.expects(:render_not_allowed_message).returns true
      end
      
    end
    
  end

  context "friend_only action when friends" do
    
    setup do
      @old_permission = MembersController.permission_level(:show)
      MembersController.friend_only(:show)
      @member = Factory.build(:member, :id => 1234)
      Member.stubs(:find).returns @member
      Member.stubs(:find).with {|*args| args.first == :all}.returns [@member]
      @friend = Factory.build(:member, :id => 456)
      @friend.stubs(:friends).returns [@member]
      @controller.stubs(:find_logged_in_member).returns @friend
      stub_finds(Section)
    end
    
    teardown do
      MembersController.send(:set_permission_level, :show, @old_permission)
    end
    
    context "GET" do
      
      setup do
        get :show, :id => 123
      end
      
      before_should "find the logged-in member" do
        @controller.expects(:find_logged_in_member).returns @friend
      end
      
      before_should "find the member" do
        Member.expects(:find).with('123').returns @member
      end
      
      before_should "check the logged-in member's friends" do
        @friend.expects(:friends).returns [@member]
      end
      
      should render_template(:show)
      
    end
    
  end
        
  context "friend_only action when logged-in as admin" do
    
    setup do
      @old_permission = MembersController.permission_level(:show)
      MembersController.friend_only(:show)
      @member = Factory.build(:member, :id => 123)
      Member.stubs(:find).returns @member
      Member.stubs(:find).with {|*args| args.first == :all}.returns [@member]
      @not_friend = Factory.build(:admin_member, :id => 456)
      @not_friend.stubs(:friends).returns [Factory.build(:member)]
      @controller.stubs(:find_logged_in_member).returns @not_friend
      stub_finds(Section)
    end
    
    teardown do
      MembersController.send(:set_permission_level, :show, @old_permission)
    end
    
    context "GET" do
      
      setup do
        get :show, :id => 123
      end

      before_should "find the logged-in member" do
        @controller.expects(:find_logged_in_member).returns @not_friend
      end
    
      before_should "find the member" do
        Member.expects(:find).with('123').returns @member
      end
    
      should render_template(:show)
      
    end      
    
  end
  
  context "friend_only action when logged-in as owner" do
    
    setup do
      @old_permission = MembersController.permission_level(:show)
      MembersController.friend_only(:show)
      @member = Factory.build(:member, :id => 123)
      Member.stubs(:find).returns @member
      Member.stubs(:find).with {|*args| args.first == :all}.returns [@member]
      @controller.stubs(:find_logged_in_member).returns @member
      stub_finds(Section)
    end
    
    teardown do
      MembersController.send(:set_permission_level, :show, @old_permission)
    end
    
    context "GET" do
      
      setup do
        get :show, :id => 123
      end
      
      before_should "find the logged-in member" do
        @controller.expects(:find_logged_in_member).returns @member
      end
      
      before_should "find the member" do
        Member.expects(:find).with('123').returns @member
      end
      
      should render_template(:show)
      
    end
    
  end
  
  context "friend_only action when not logged-in" do

    setup do
      @old_permission = MembersController.permission_level(:show)
      MembersController.friend_only(:show)
      @controller.stubs(:find_logged_in_member).returns nil
    end
    
    teardown do
      MembersController.send(:set_permission_level, :show, @old_permission)
    end
    
    context "GET" do
      
      setup do
        get :show, :id => 123
      end

      before_should "find no logged-in member" do
        @controller.expects(:find_logged_in_member).returns nil
      end
      
      before_should "not attempt to find the member" do
        Member.expects(:find).never
      end
      
      should "redirect to login" do
        assert_redirected_to(new_session_url)
      end
      
    end
    
  end
  
  
end

