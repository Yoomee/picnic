class FrontCoversController < ApplicationController
  
  admin_only :index, :new, :create, :show, :edit, :update, :destroy
  
  before_filter :get_front_cover, :only => %w{edit show update destroy}
  
  def destroy
    @front_cover.destroy
    redirect_to front_covers_path
  end
  
  def update
    if @front_cover.update_attributes(params[:front_cover])
      flash[:notice] = 'Front cover successfully updated'
      redirect_to @front_cover
    else
      render :action => 'edit'
    end
  end
    
  def edit
  end
  
  def index
    @front_covers = FrontCover.latest
  end
  
  def new
    @front_cover = FrontCover.new
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
   
  def show
  end
  
  private
  def get_front_cover
    @front_cover = FrontCover.find(params[:id])   
  end
  
end