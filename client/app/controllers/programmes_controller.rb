class ProgrammesController < ApplicationController
  
  before_filter :set_section

  def show
    params[:conference_id] ||= 1
    @conference = Conference.find(params[:conference_id])
    if params[:day]
      @date = @conference.days[params[:day].to_i - 1] || @conference.starts_on
    elsif Date.today > @conference.starts_on && Date.today <= @conference.ends_on
      @date = Date.today
      @time = Time.now
    else
      @date = @conference.starts_on
    end
    params.delete(:me) if params[:me] && !logged_in?
    @venues = @conference.venues.with_sessions.descend_by_weight.all
  end
  
  private
  def set_section
    @section = Section.find_by_slug("picnic11")
  end
  
  
end