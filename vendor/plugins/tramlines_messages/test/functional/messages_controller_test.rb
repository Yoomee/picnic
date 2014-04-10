require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class MessagesControllerTest < ActionController::TestCase

  should have_action(:create).with_default_level(:member_only)
  should have_action(:new).with_default_level(:member_only)
  
  context "create action" do    

    setup do
      logged_in_member = create_logged_in_member
    end
    
    should "render new template when model is invalid" do
      Message.any_instance.stubs(:valid?).returns(false)
      post :create
      assert_template 'new'
    end
    
    should "redirect when model is valid" do
      Message.any_instance.stubs(:valid?).returns(true)
      post :create
      respond_with(:redirect)
    end

  end
  
  context "destroy action" do

    setup do
      @message = Factory.create(:message, :member => expect_logged_in_member)
    end
    
    should "destroy model and redirect to index action" do
      delete :destroy, :id => @message
      assert_redirected_to messages_url
    end

  end

  context "index action" do 

    should "render index template" do
      logged_in_member = expect_logged_in_member
      Member.stubs(:find).returns logged_in_member
      Member.stubs(:find).with {|*args| args.first == :all}.returns [logged_in_member]
      stub_finds(Section)
      get :index
      assert_template 'index'
    end

  end
  
  context "new action" do

    setup do
      stub_access
    end

    should "render new template" do
      logged_in_member = create_logged_in_member
      get :new
      assert_template 'new'
    end

  end
  
  context "show action" do

    setup do
      @message = Factory.create(:message, :member => expect_logged_in_member)
      stub_finds(Section)
    end
    
    should "render show template" do
      get :show, :id => @message
      assert_template 'show'
    end

  end
  
end
