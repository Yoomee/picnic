class ApiController < ApplicationController
  
  def program
    conference = Conference.first
    if params[:version].to_i < conference.version
      out = {:version => conference.version, :venues => conference.venues, :conference_sessions => conference.sessions, :members => Member.with_badge(:picnic11_speaker)}
      render :json => out.to_json(:api => true)
    else
      render :json => {:success => true}
    end
  end
  
end