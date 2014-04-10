module FriendRequestsHelper
  
  def render_add_friend_link(member, options = {})
    return "" if @logged_in_member.nil? || @logged_in_member == member
    options.reverse_merge!(:ajax_loader => "ajax_loader.gif", :text => "Add as friend")
    render("friend_requests/new", :member => member, :ajax_loader => options.delete(:ajax_loader), :options => options)
  end
  
end