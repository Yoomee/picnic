module TramlinesReferrals::NotifierExtensions

  def referral_email(referral, recipient)
    recipients recipient
    from (!referral.email.blank? ? referral.email : referral.member_email)
    subject referral.subject
    @message = referral.message
    content_type "multipart/alternative"
    part :content_type => "text/plain", :body => render_message("referral_email.text.plain", {})
    part :content_type => "text/html", :body => render_message("referral_email.text.html", {})
  end

end