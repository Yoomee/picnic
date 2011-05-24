class ConferenceDelegatesController < ApplicationController
  
  admin_only :index  
  
  def index
    @conference_delegates = ConferenceDelegate.latest.paginate(:page => params[:page], :per_page => 20)
  end

  
end