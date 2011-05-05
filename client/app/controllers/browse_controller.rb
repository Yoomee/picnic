class BrowseController < ApplicationController
  
  def index
    @stories = Shout.latest.paginate(:per_page => 9, :page => params[:page])
  end
  
end