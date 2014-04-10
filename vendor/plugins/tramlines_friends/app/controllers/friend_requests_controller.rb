class FriendRequestsController < ApplicationController
  
  member_only :accept, :create, :destroy

  def accept
    @friend_request = FriendRequest.find(params[:id])
    if request.xhr?
      deal_with_accept
    else
      if @logged_in_member != @friend_request.member_target
        flash[:error] = "You do not have permission to accept this friend request"
      elsif @friend_request.accept!
        flash[:notice] = "You are now friends with #{@template.link_to(@friend_request.member, @friend_request.member)}"
      end
      redirect_to waypoint || notifications_path
    end
  end
  
  def allowed_to_with_extension?(url_options, member)
    return false if !allowed_to_without_extension?(url_options, member)
    if url_options[:action]=="create"
      if params[:friend_request]
        @member_target = Member.find_by_id(params[:friend_request][:member_id_target])
      else
        @member_target = Member.find(params[:member_id])
      end
      member.can_request_friendship_with?(@member_target)
    else
      true
    end
  end
  alias_method_chain :allowed_to?, :extension

  def create
    if params[:friend_request]
      @friend_request = FriendRequest.new(params[:friend_request].merge(:member => @logged_in_member))
      if @friend_request.save
        deal_with_create
      else
        render :update do |page|
          page[:friend_request_form].replace(render("form", :friend_request => @friend_request))
        end
      end
    else
      # @member_target = Member.find(params[:member_id])
      FriendRequest.create(:member => @logged_in_member, :member_target => @member_target)
      deal_with_create
    end
  end
  
  def destroy
    @friend_request = FriendRequest.find(params[:id])
    if request.xhr?
      deal_with_destroy
    else
      if @logged_in_member != @friend_request.member_target
        flash[:error] = "You do not have permission to reject this friend request"
      elsif @friend_request.destroy
        flash[:notice] = "Notification deleted"
        return redirect_to(notifications_path)
      else
        flash[:error] = "Could not delete friend request"
      end
      redirect_to waypoint || notifications_path
    end
  end
  
  def new
    friend_request = FriendRequest.new(:member_id_target => params[:member_id])
    render :partial => "form", :locals => {:friend_request => friend_request}
  end
  
  private
  def deal_with_accept
    render :update do |page|
      if logged_in_as?(@friend_request.member_target) && @friend_request.accept!
        page["#friend_request_#{@friend_request.member_id}_link"].replace_html("You are now friends with #{@friend_request.member.forename}.")
      end
    end
  end
  
  def deal_with_create
    render :update do |page|
      page << "$.fancybox.close();"
      page["#friend_request_#{@member_target.id}_link"].replace(render("friend_requests/add_friend_link", :member => @member_target))
    end
  end
  
  def deal_with_destroy
    render :update do |page|
      if @logged_in_member == @friend_request.member_target && @friend_request.destroy
        page["#friend_request_#{@friend_request.member_id}_link"].replace_html("Friend request rejected.")
      end
    end
  end
  
end
