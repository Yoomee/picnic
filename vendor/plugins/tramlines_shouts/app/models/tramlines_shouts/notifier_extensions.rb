module TramlinesShouts::NotifierExtensions

  def notification_shout(notification)
    @logged_in_member = recipient = notification.member    
    recipients recipient.email
    from APP_CONFIG['site_email']
    content_type "multipart/alternative"
    subject "#{APP_CONFIG['site_name']} - New post"
    locals = {:shout => notification.attachable, :recipient => recipient}
    part :content_type => "text/plain", :body => render_message("notifier/notifications/shout.text.plain", locals)
    part :content_type => "text/html", :body => render_message("notifier/notifications/shout.text.html", locals)
  end
  
  def notification_wall_post(notification, wall_post)
    @logged_in_member = recipient = notification.member
    recipients recipient.email
    from APP_CONFIG['site_email']
    content_type "multipart/alternative"
    subject "#{APP_CONFIG['site_name']} - New comment"
    locals = {:wall_post => wall_post, :recipient => recipient}
    part :content_type => "text/plain", :body => render_message("notifier/notifications/wall_post.text.plain", locals)
    part :content_type => "text/html", :body => render_message("notifier/notifications/wall_post.text.html", locals)
  end
  
end