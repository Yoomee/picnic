class ProgrammesController < ApplicationController
  
  before_filter :set_section
  
  def show
    if Date.today > Date.parse("2011-09-14") && Date.today <= Date.parse("2011-09-16")
      @date = Date.today
      @time = Time.now
    else
      @date = Date.parse("2011-09-14")
    end  
    @venues = Venue.with_sessions_in_year(2011)
    
  end
  
  private
  def set_section
    @section = Section.find_by_slug("picnic11")
  end
  
  
end