require File.dirname(__FILE__) + '/../../../test/test_helper'
class FrontCoversControllerTest < ActionController::TestCase
  
  should route(:post, "/front_covers/123/activate").to(:controller => 'front_covers', :action => 'activate', :id => 123)
  should route(:post, "/front_covers/123/deactivate").to(:controller => 'front_covers', :action => 'deactivate', :id => 123)
  
  should have_action(:activate).with_level(:admin_only)
  should have_action(:create).with_level(:admin_only)
  should have_action(:deactivate).with_level(:admin_only)
  should have_action(:destroy).with_level(:admin_only)
  should have_action(:edit).with_level(:admin_only)
  should have_action(:index).with_level(:admin_only)
  should have_action(:new).with_level(:admin_only)
  should have_action(:show).with_level(:admin_only)
  should have_action(:update).with_level(:admin_only)

  context "activate" do
    
    setup do
      stub_access
      @front_cover = Factory.build(:front_cover)
      FrontCover.stubs(:find).returns @front_cover
      @front_cover.stubs(:activate!).returns true
    end
    
    context "POST" do
      
      setup do
        post :activate, :id => 123
      end
      
      before_should "find the front cover" do
        FrontCover.expects(:find).with('123').returns @front_cover
      end
      
      before_should "activate the front cover" do
        @front_cover.expects(:activate!).returns true
      end
      
      should redirect_to("the homepage") {root_path}
      
    end
    
  end

  context "create with invalid attributes" do
    
    setup do
      stub_access
      @front_cover = Factory.build(:front_cover)
      FrontCover.stubs(:new).returns @front_cover
      @front_cover.stubs(:save).returns false
    end
    
    context "POST" do
      
      setup do
        post :create, :front_cover => {:valid_attributes => false}
      end
      
      before_should "initialize the front cover" do
        FrontCover.expects(:new).with('valid_attributes' => false).returns @front_cover
      end
      
      before_should "save the front cover" do
        @front_cover.expects(:save).returns false
      end
      
      should assign_to(:front_cover).with {@front_cover}
      should render_template(:new)
      
    end
    
  end
  
  context "create with valid attributes" do
    
    setup do
      stub_access
      @front_cover = Factory.build(:front_cover, :id => 123)
      FrontCover.stubs(:new).returns @front_cover
      @front_cover.stubs(:save).returns true
      # For generating path
      @front_cover.stubs(:new_record?).returns false
    end
    
    context "POST" do
      
      setup do
        post :create, :front_cover => {:valid_attributes => true}
      end
      
      before_should "initialize the front cover" do
        FrontCover.expects(:new).with('valid_attributes' => true).returns @front_cover
      end
      
      before_should "save the front cover" do
        @front_cover.expects(:save).returns true
      end
      
      should redirect_to("the front cover") {front_cover_path(@front_cover)}
      
    end
    
  end
      
  context "deactivate" do

     setup do
       stub_access
       @front_cover = Factory.build(:front_cover, :id => 123)
       @front_cover.stubs(:new_record?).returns false
       FrontCover.stubs(:find).returns @front_cover
       @front_cover.stubs(:deactivate!).returns true
     end

     context "POST" do

       setup do
         post :deactivate, :id => 123
       end

       before_should "find the front cover" do
         FrontCover.expects(:find).with('123').returns @front_cover
       end

       before_should "deactivate the front cover" do
         @front_cover.expects(:deactivate!).returns true
       end

       should redirect_to("the front cover") {front_cover_path(@front_cover)}

     end

   end

  context "destroy" do
    
    setup do
      stub_access
      @front_cover = Factory.build(:front_cover)
      FrontCover.stubs(:find).returns @front_cover
      @front_cover.stubs(:destroy).returns @front_cover
    end
    
    context "DELETE" do
      
      setup do
        delete :destroy, :id => 123
      end
      
      before_should "find the front cover" do
        FrontCover.expects(:find).with('123').returns @front_cover
      end
      
      before_should "destroy the front cover" do
        @front_cover.expects(:destroy).returns @front_cover
      end
      
      should redirect_to("the index") {front_covers_path}
      
    end
    
  end

  context "edit" do
    
    setup do
      stub_access
      @front_cover = Factory.build(:front_cover)
      FrontCover.stubs(:find).returns @front_cover
    end
    
    context "GET" do
      
      setup do
        get :edit, :id => 123
      end
      
      before_should "find the front cover" do
        FrontCover.expects(:find).with('123').returns @front_cover
      end

      should assign_to(:front_cover).with {@front_cover}

      should render_template(:edit)

    end

  end

  context "index" do
    
    setup do
      stub_access
      @front_covers = [Factory.build(:front_cover), Factory.build(:front_cover)]
      FrontCover.stubs(:latest).returns @front_covers
    end
    
    context "GET" do
      
      setup do
        get :index
      end
      
      before_should "find the front covers" do
        FrontCover.expects(:latest).returns @front_covers
      end
      
      should assign_to(:front_covers).with {@front_covers}
      should render_template(:index)
      
    end
    
  end
  
  context "new" do
    
    setup do
      stub_access
      @front_cover = Factory.build(:front_cover)
      FrontCover.stubs(:new).returns @front_cover
    end
    
    context "GET" do
      
      setup do
        get :new
      end
      
      before_should "initialize the front cover" do
        FrontCover.expects(:new).returns @front_cover
      end
      
      should assign_to(:front_cover).with {@front_cover}
      
    end
    
  end
  
  context "show" do
    
    setup do
      stub_access
      @front_cover = Factory.create(:front_cover)
      FrontCover.stubs(:find).returns @front_cover
    end
    
    context "GET" do
      
      setup do
        get :show, :id => 123
      end
      
      before_should "find the front cover" do
        FrontCover.expects(:find).with('123').returns @front_cover
      end
      
      should assign_to(:front_cover).with {@front_cover}
     
      should render_template(:show)
      
    end
    
  end
  
  context "update with invalid attributes" do
    
    setup do
      stub_access
      @front_cover = Factory.build(:front_cover, :id => 123)
      FrontCover.stubs(:find).returns @front_cover
      @front_cover.stubs(:update_attributes).returns false
      # For generating path
      @front_cover.stubs(:new_record?).returns false
    end
    
    context "PUT" do
      
      setup do
        put :update, :id => 123, :front_cover => {:valid_attributes => false}
      end
      
      before_should "find the front cover" do
        FrontCover.expects(:find).with('123').returns @front_cover
      end
      
      before_should "attempt to update the front cover" do
        @front_cover.expects(:update_attributes).with('valid_attributes' => false).returns false
      end
      
      should assign_to(:front_cover).with {@front_cover}
      should render_template(:edit)
      
    end
    
  end

  context "update with valid attributes" do
    
    setup do
      stub_access
      @front_cover = Factory.build(:front_cover, :id => 123)
      FrontCover.stubs(:find).returns @front_cover
      @front_cover.stubs(:update_attributes).returns true
      # For generating path
      @front_cover.stubs(:new_record?).returns false
    end
    
    context "PUT" do
      
      setup do
        put :update, :id => 123, :front_cover => {:valid_attributes => true}
      end
      
      before_should "find the front cover" do
        FrontCover.expects(:find).with('123').returns @front_cover
      end
      
      before_should "update the front cover" do
        @front_cover.expects(:update_attributes).with('valid_attributes' => true).returns true
      end
      
      should redirect_to("the front cover") {front_cover_path(@front_cover)}
      
    end
    
  end
      
end

