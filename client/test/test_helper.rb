ApplicationControllerConcerns::Twitter.module_eval do
  
  def get_latest_tweets_from(user, limit = 4, replies = false, with_dates = false, &block)
    []
  end
  
end