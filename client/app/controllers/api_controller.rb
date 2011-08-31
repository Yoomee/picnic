class ApiController < ApplicationController
  
  def program
    conference = Conference.first
    if params[:version].to_i < conference.version
      out = {:update => 1, :version => conference.version, :venues => conference.venues, :conference_sessions => conference.sessions.with_tags, :members => Member.with_badge(:picnic11_speaker)}
      out = out.to_json(:api => true)
      render :json => out
    else
      render :json => {:update => 0}
    end
  end
  
end