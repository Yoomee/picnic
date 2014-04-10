class PointsEventsController < ApplicationController

  admin_only :create, :destroy, :edit, :new, :index, :update

  before_filter :get_points_event, :only => %w{edit destroy update}
    
  def create
    @points_event = PointsEvent.new(params[:points_event])
    if @points_event.save
      flash[:notice] = "Points event created."
      redirect_to points_events_path
    else
      render :action => "new"
    end
  end  

  def destroy
    if @points_event.destroy
      flash[:notice] = "Points event deleted."
    else
      flash[:error] = "Points event could not be deleted."
    end
    redirect_to points_events_path
  end

  def edit
    
  end
  
  def new
    @points_event = PointsEvent.new
  end
  
  def index
    @points_events = PointsEvent.all
  end
  
  def update
    if @points_event.update_attributes(params[:points_event])
      flash[:notice] = "Points event updated."
      redirect_to points_events_path
    else
      render :action => "edit"
    end
  end
  
  private
  def get_points_event
    @points_event = PointsEvent.find(params[:id])
  end
  
end