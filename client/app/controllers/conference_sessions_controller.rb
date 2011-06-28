class ConferenceSessionsController < ApplicationController
  
  admin_only :create, :edit, :destroy, :index, :new, :update

  before_filter :get_conference_session, :only => %w{destroy edit show update}
  
  def create
    @conference_session = ConferenceSession.new params[:conference_session]
    if @conference_session.save
      flash[:notice] = 'Session successfully created'
      redirect_to @conference_session
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @conference_session.destroy
    flash[:notice] = "Session successfully deleted"
    redirect_to conference_sessions_path
  end
  
  def edit
  end
  
  def index
    @conference_sessions = ConferenceSession.all(:order => 'starts_at')
  end
  
  def new
    @conference_session = ConferenceSession.new(:conference => Conference.find(params[:conference_id]), :starts_at =>DateTime.parse("2011-09-14T09:00"), :ends_at => DateTime.parse("2011-09-14T10:00"))
  end
  
  def show
  end
  
  def update
    if @conference_session.update_attributes(params[:conference_session])
      flash[:notice] = 'Session successfully updated'
      redirect_to @conference_session
    else
      render :action => 'edit'
    end
  end
  
  private
  def get_conference_session
    @conference_session = ConferenceSession.find(params[:id])
    @section = Section.find_by_slug("picnic11")
  end
  
end