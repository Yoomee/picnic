module TramlinesBannings::NotifierExtensions
  
  def ban_notification(banning)
    recipients banning.member_email
    from APP_CONFIG['site_email']
    subject banning.message_subject
    content_type "multipart/alternative"
    @banning = banning
    part :content_type => "text/plain", :body => render_message("ban_notification.text.plain", {})
    part :content_type => "text/html", :body => render_message("ban_notification.text.html", {})
  end
  
end