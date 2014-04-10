class PointsTransfersController < ApplicationController
    
  dont_set_waypoint_for :index
    
  def index
    @points_transfers = Member.find(params[:member_id]).points_transfers.latest.paginate(:per_page => 8, :page => params[:page])
    render :layout => false
  end
  
end