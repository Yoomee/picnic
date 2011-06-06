FriendRequestsController.class_eval do

  def accept
    @friend_request = FriendRequest.find(params[:id])
    if request.xhr?
      deal_with_accept
    else
      if @logged_in_member != @friend_request.member_target
        flash[:error] = "You do not have permission to accept this friend request"
      elsif @friend_request.accept!
        flash[:notice] = "You are now sitting on #{@friend_request.member.forename}'s blanket"
      end
      redirect_to waypoint || notifications_path
    end
  end
  
  private
  def deal_with_accept
    render :update do |page|
      if logged_in_as?(@friend_request.member_target) && @friend_request.accept!
        page["#friend_request_#{@friend_request.member_id}_link"].replace_html("You are now sitting on #{@friend_request.member.forename}'s blanket.")
        page["#friend_list_#{@friend_request.member_id}"].replace(render("members/friend_list", :member => @friend_request.member(true)))
        page << refresh_fb_dom        
      end
    end
  end
  
  def deal_with_create
    render :update do |page|
      page["#friend_request_#{@member_target.id}_link"].replace(render("friend_requests/add_friend_link", :member => @member_target))
      page[".friends_list"].replace_html(render("members/friends", :member => @member_target))
      page << refresh_fb_dom
    end
  end
  
end