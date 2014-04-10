module TramlinesNotifications::NotifierExtensions

  def self.included(klass)
    klass.helper(:notifications)
  end
  
  def notification_notification notification
    recipients notification.member_email
    from APP_CONFIG['site_email']
    content_type "multipart/alternative"
    @logged_in_member = notification.member
    locals = {:notification => notification, :recipient => notification.member}
    locals[notification.attachable_type.underscore.to_sym] = notification.attachable if notification.has_attachable?
    if notification.has_attachable? && notifier_view_exists?("notifier/notifications/#{notification.attachable_type.underscore}")
      subject "#{APP_CONFIG['site_name']} - New #{notification.attachable_name}"
      partial_name = "notifier/notifications/#{notification.attachable_type.underscore}"
    else
      subject "#{APP_CONFIG['site_name']} - New notification"
      partial_name = "notifier/notifications/notification"
    end
    part :content_type => "text/plain", :body => render_message("#{partial_name}.text.plain", locals)
    part :content_type => "text/html", :body => render_message("#{partial_name}.text.html", locals)
  end

end
