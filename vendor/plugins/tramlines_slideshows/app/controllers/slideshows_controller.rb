class SlideshowsController < ApplicationController

  admin_only :create, :destroy, :edit, :index, :new, :show, :update, :order, :update_weights

  before_filter :get_slideshow, :only => [:destroy, :edit, :show, :update, :order, :update_weights]

  def create
    @slideshow = Slideshow.new(params[:slideshow])
    if @slideshow.save
      flash[:notice] = "Successfully created slideshow."
      redirect_to @slideshow
    else
      render :action => 'new'
    end
  end

  def destroy
    @slideshow.destroy
    flash[:notice] = "Successfully deleted slideshow."
    redirect_to_waypoint_after_destroy
  end

  def edit

  end
  
  def index
		@slideshows = Slideshow.all
	end  
  
  def new
    @slideshow = Slideshow.new
  end
  
  def order
  end

  def show
  
  end

  def update
    if @slideshow.update_attributes(params[:slideshow])
      flash[:notice] = "Successfully updated slideshow."
      redirect_to @slideshow
    else
      render :action => 'edit'
    end
  end
  
  def update_weights
    params[:slideshow_items].each do |index, sortable_hash|
      SlideshowItem.find(sortable_hash["sortable_id"]).update_attribute(:position, index)
    end
    redirect_to (@slideshow.attachable || root_path)
  end
  
  private
  def get_slideshow
    @slideshow = Slideshow.find(params[:id])
  end

end