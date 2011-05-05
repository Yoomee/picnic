class ProgrammesController < ApplicationController
  
  before_filter :set_section
  
  def show
    
  end
  
  private
  def set_section
    @section = Section.find_by_slug("picnic11")
  end
  
  
end