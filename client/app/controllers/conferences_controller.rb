class ConferencesController < ApplicationController
  
  admin_only :create, :edit, :destroy, :index, :new, :update

  before_filter :get_conference, :only => %w{destroy edit show update}
  
  def create
    @conference = Conference.new params[:conference]
    if @conference.save
      flash[:notice] = 'Conference successfully created'
      redirect_to @conference
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @conference.destroy
    flash[:notice] = "Conference successfully deleted"
    redirect_to conferences_path
  end
  
  def edit
  end
  
  def index
    @conferences = Conference.all(:order => 'name')
  end
  
  def new
    @conference = Conference.new(:starts_on => Date.today, :ends_on => 1.week.from_now)
  end
  
  def show
  end
  
  def update
    if @conference.update_attributes(params[:conference])
      flash[:notice] = 'Conference successfully updated'
      redirect_to @conference
    else
      render :action => 'edit'
    end
  end
  
  private
  def get_conference
    @conference = Conference.find(params[:id])
  end
  
end