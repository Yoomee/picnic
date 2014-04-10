class FriendsController < ApplicationController
  
  member_only :index
  
  def index
    @member = Member.find(params[:member_id])
    @friends = @member.friends.paginate(:per_page => 50, :page => params[:page], :order => "members.forename, members.surname")
  end
  
end