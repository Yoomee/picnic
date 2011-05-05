module NewsNetworkHelper
  
  def in_news_network?
    is_home? || controller_name == 'correspondents'
  end
  
end