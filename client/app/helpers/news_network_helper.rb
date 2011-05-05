module NewsNetworkHelper
  
  def in_news_network?
    is_home? || controller_name.in?(%w{browse correspondents tags})
  end
  
end