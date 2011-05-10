class NewsNetworkController < ApplicationController
  
  admin_only :index
  
  def index;end
  
end