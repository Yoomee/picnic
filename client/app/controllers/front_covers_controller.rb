class FrontCoversController < ApplicationController
  
  admin_only :activate, :create, :deactivate, :destroy, :edit, :index, :new, :show, :update

  before_filter :get_front_cover, :only => %w{edit show update destroy activate deactivate}
  
  def activate
    @front_cover.activate!
    redirect_to_waypoint
  end
  
  def create
    @front_cover = FrontCover.new(params[:front_cover])
    if @front_cover.save
      flash[:notice] = 'New front cover successfully created'
      redirect_to @front_cover
    else
      render :action => 'new'
    end
  end
   
  def deactivate
    @front_cover.deactivate!
    flash[:notice] = 'This front cover has now been deactivated. The default front cover page will be shown instead'
    redirect_to_waypoint
  end
  
  def destroy
    @front_cover.destroy
    redirect_to front_covers_path
  end
  
  def edit
  end
  
  def index
    @front_covers = FrontCover.latest
  end
  
  def new
    @front_cover = FrontCover.default
  end
  
  def show
  end
  
  def update
    if @front_cover.update_attributes(params[:front_cover])
      flash[:notice] = 'Front cover successfully updated'
      redirect_to_waypoint
    else
      render :action => 'edit'
    end
  end
    
  private
  def get_front_cover
    @front_cover = FrontCover.find(params[:id])   
  end
  
end
