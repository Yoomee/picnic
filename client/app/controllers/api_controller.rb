class ApiController < ApplicationController
  
  before_filter :get_member, :only => [:attend, :unattend, :program, :sync_attending]
  before_filter :get_conference_session, :only => [:attend, :unattend]
  
  protect_from_forgery :except => :sync_attending
  
  def authenticate
    if logged_in?
      logged_in_member.update_attribute(:api_authenticated, true) unless logged_in_member.api_authenticated?
      redirect_to :controller => "api", :action => "redirect"
    else
      session[:api_auth] = true
      redirect_to new_session_path
    end
  end
  
  def attend
    if (@conference_session && @member && @conference_session.attend!(@member))
      render :json => {:success => 1, :attending => (@member.attending?(@conference_session) ? 1 : 0)}
    else
      render :json => {:success => 0}
    end
  end
  
  def unattend
    if (@conference_session && @member && @conference_session.unattend!(@member))
      render :json => {:success => 1, :attending => (@member.attending?(@conference_session) ? 1 : 0)}
    else
      render :json => {:status => 0}
    end
  end
  
  def program
    conference = Conference.find_by_id(params[:conference_id]) || Conference.first
    if @member
      @member.update_attribute(:api_authenticated, true) unless @member.api_authenticated?
    end
    if (params[:version].to_i < conference.version) || (@member && (params[:my_program_version].to_i <  @member.my_program_version))
      out = {:update => 1}
      if params[:version].to_i < conference.version
        out.merge!(:version => conference.version, :venues => conference.venues, :conference_sessions => conference.sessions.with_tags, :members => Member.with_badge(:picnic11_speaker),:tags => Tag.find(:all, :conditions => "tags.color IS NOT NULL"))
      end
      if (@member && (params[:my_program_version].to_i <  @member.my_program_version))
        out.merge!(:my_program_version => @member.my_program_version, :my_session_ids => @member.conference_sessions_attending.collect(&:id))
      end
      out = out.to_json(:api => true)
      render :json => out.gsub(/\222/, "'").gsub(/[\x80-\xFF]/,"")
    else
      render :json => {:update => 0}
    end
  end
  
  def sync_attending
    if @member && (conference_sessions = ActiveSupport::JSON.decode(params[:conference_sessions]))
      conference_sessions.each do |appSession|
        if webSession = ConferenceSession.find_by_id(appSession["id"])
          csm = ConferenceSessionsMember.find_or_initialize_by_conference_session_id_and_member_id(webSession.id, @member.id)
          appAttending = !appSession["attending"].zero?
          if csm.new_record? || (appSession["timestamp"].to_f > csm.updated_at.to_f)
            csm.attending = appAttending
          end
          csm.save
        end
      end
      render :json => {:success => 1}
    else
      render :json => {:success => 0}
    end
  end
  
  def redirect
    redirect_to :action => :authenticate if !logged_in?
  end
  
  private
  def get_member
    @member = Member.find_by_api_key(params[:api_key])
  end
  
  def get_conference_session
    @conference_session = ConferenceSession.find_by_id(params[:id])
  end
  
end