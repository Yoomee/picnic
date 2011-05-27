FriendRequestsController.class_eval do
  
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
      page[".friends_list"].replace_html(render("members/friends", :member => @member_target))
      page << refresh_fb_dom
    end
  end
  
end