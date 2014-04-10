module NotificationsHelper
  
  def render_notification(notification)
    locals = {:notification => notification}
    locals[notification.attachable_type.underscore.to_sym] = notification.attachable if notification.has_attachable?
    partial = partial_exists?(notification.partial_name) ? notification.partial_name : "notifications/notification"
    Rails.logger.info("locals = #{locals.inspect}")
    render(partial, locals)
  end
  
end