Notifier.class_eval do
  
  def club_invite conference_delegate
    recipients conference_delegate.email
    from APP_CONFIG['site_email']
    subject "PICNIC: Come and join the club!"
    @conference_delegate = conference_delegate
    content_type "multipart/alternative"    
    part :content_type => "text/plain", :body => render_message("club_invite.text.plain", {})
    part :content_type => "text/html", :body => render_message("club_invite.text.html", {})
  end
  
end