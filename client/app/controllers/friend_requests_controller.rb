FriendRequestsController.class_eval do
  
  def create
    member_target = Member.find(params[:member_id])
    FriendRequest.create(:member => @logged_in_member, :member_target => member_target)
    render :update do |page|
      page["#no_friends"].replace(render("friend_requests/add_friend_link", :member => member_target))
      page["#friend_request_#{member_target.id}"].replace(render("friend_requests/add_friend_link", :member => member_target))
    end
  end
  
end