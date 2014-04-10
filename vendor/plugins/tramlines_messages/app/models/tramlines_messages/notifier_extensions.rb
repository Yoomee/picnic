module TramlinesMessages::NotifierExtensions
  
  def self.included(klass)
    klass.helper :messages
  end
  
  def new_inbox_message(message, recipient)
    @accepts_mail_response = ApplicationController::plugin_installed?(:tramlines_mail_response)
    recipients recipient.email
    reply_to message.mail_response_email_for(recipient) if @accepts_mail_response
    from APP_CONFIG['site_email']
    @message = message
    @recipient = @logged_in_member = recipient
    subject "#{APP_CONFIG['site_name']} - #{message.author} sent you a message"
    content_type "multipart/alternative"
    part :content_type => "text/plain", :body => render_message("new_inbox_message.text.plain", {})
    part :content_type => "text/html", :body => render_message("new_inbox_message.text.html", {})
  end
  
end