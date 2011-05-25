module NewsNetworkHelper
  
  def in_news_network?
    controller_name.in?(%w{browse correspondents news_network})
  end
  
end