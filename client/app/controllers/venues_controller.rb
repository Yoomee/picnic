class VenuesController < ApplicationController
  
  admin_only :create, :edit, :destroy, :index, :new, :update

  before_filter :get_venue, :only => %w{destroy edit show update}
  
  def create
    @venue = Venue.new params[:venue]
    if @venue.save
      flash[:notice] = 'Venue successfully created'
      redirect_to_waypoint
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @venue.destroy
    flash[:notice] = "Venue successfully deleted"
    redirect_to venues_path
  end
  
  def edit
  end
  
  def index
    @venues = Venue.all(:order => 'name')
  end
  
  def new
    @venue = Venue.new
  end
  
  def show
  end
  
  def update
    if @venue.update_attributes(params[:venue])
      flash[:notice] = 'Venue successfully updated'
      redirect_to_waypoint
    else
      render :action => 'edit'
    end
  end
  
  private
  def get_venue
    @venue = Venue.find(params[:id])
    @section = Section.find_by_slug("picnic11")
  end
  
end