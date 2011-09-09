class ConferenceSessionsController < ApplicationController
  
  admin_only :create, :edit, :destroy, :index, :new, :update, :duplicate
  member_only :attend, :unattend

  before_filter :get_conference_session, :only => %w{destroy edit show update attend unattend}

  cache_sweeper :conference_session_sweeper

  def attend
    if !logged_in_member.attending?(@conference_session)
      @conference_session.attend!(logged_in_member)
      render :update do |page|
        page[:attend_link].replace(render("conference_sessions/attend_link", :session => @conference_session))
        page[:attendees_list].prepend(link_to(image_for(@logged_in_member, "50x50#"), @logged_in_member, :title => @logged_in_member, :id => "attendee_#{@logged_in_member.id}", :class => "attendee"))
        page[:no_one_attending].remove
        page << refresh_fb_dom
      end
    else
      render :nothing => true
    end
  end

  def unattend
    if logged_in_member.attending?(@conference_session)
      @conference_session.unattend!(logged_in_member)
      render :update do |page|
        page[:attend_link].replace(render("conference_sessions/attend_link", :session => @conference_session))
        page << "$('#attendee_#{logged_in_member.id}').fadeOut('slow', function(){$(this).remove();});"
      end
    else
      render :nothing => true
    end
  end
  
  def create
    handle_facelist
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
    redirect_to @conference_session.conference
  end
  
  def duplicate
    @existing_session = ConferenceSession.find(params[:id])
    @conference_session = @existing_session.clone
    @conference_session.duplicate_of = @existing_session.id
    @conference_session.tag_list = @existing_session.tag_list.dup
    @conference_session.conference_sessions_members = @existing_session.conference_sessions_members.collect(&:clone)
    render :action => :new
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
    handle_facelist
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
  
  def handle_facelist
    params[:conference_session] ||= {}
    params[:conference_session][:tag_list] = params[:facelist_values_conference_session_themes] if !params[:facelist_values_conference_session_themes].nil?
  end
  
end