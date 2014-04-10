class NotificationsController < ApplicationController
  
  member_only :index
  owner_only :destroy, :show
  
  after_filter :set_notifications_as_read, :only => :index
  
  def index
    @unread_notifications = @logged_in_member.notifications.unread.latest
    num_read_to_show = (15 - @unread_notifications.count)
    @read_notifications = num_read_to_show <= 0 ? [] : @logged_in_member.notifications.read.latest.limit(num_read_to_show)
  end
  
  def destroy
    @notification = Notification.find(params[:id])
    if @notification.destroy
      flash[:notice] = "Notification deleted"
    else
      flash[:error] = "Could not delete notification"
    end
    redirect_to notifications_path
  end
  
  private
  def set_notifications_as_read
    @unread_notifications.each(&:read!)
  end
  
end