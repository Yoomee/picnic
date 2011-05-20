NewsFeedHelper.module_eval do
  
  def shout_news_feed_intro(shout)
    case
    when shout.recipient_type=="Member"
      shout.recipient==shout.member ? "" : "posted on #{link_to_self(shout.recipient, :class => "member_name")}'s wall"
    else
      ""
    end
  end
  
end