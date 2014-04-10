module TramlinesConnections::MemberExtensions

  def self.included(klass)
    klass.has_many :friend_of_a_friends, :through => :friend_of_a_friendships
    klass.has_many :friend_of_a_friendships
  end

  def connections(options = {})
    ConnectionSet.new(self, options).connections
  end
  
  def twitter_friends
    if twitter_token.blank? || twitter_secret.blank?
      []
    else
      access_token = prepare_access_token(:twitter, twitter_token, twitter_secret) 
      response = access_token.request(:get, "http://api.twitter.com/1/friends/ids.json?user_id=#{twitter_id}")
      friend_ids = JSON.parse(response.body)
      Member.without_friend_request_with(self).find(:all, :conditions => ["twitter_id IN (?)", friend_ids]) 
    end
  end
  
  def linked_in_friends
    if linked_in_token.blank? || linked_in_secret.blank?
      []
    else
      access_token = prepare_access_token(:linked_in, linked_in_token, linked_in_secret)
      response = access_token.request(:get, "http://api.linkedin.com/v1/people/id=#{linked_in_user_id}/connections")
      puts "response = #{response.body.inspect}"
      doc = Hpricot.parse(response.body)
      friend_ids = []
      friend_urls = {}
      (doc/'person').each do |person|
        person_id = (person/'id').inner_html
        friend_ids << person_id
        friend_urls[person_id] = (person/'site-standard-profile-request url').inner_html
      end
      friends = Member.without_friend_request_with(self).find(:all, :conditions => ["linked_in_user_id IN (?)", friend_ids])
      # Currently the URL we get doesn't seem to link to the profile
      friends.each do |friend|
        friend.metaclass.instance_eval {attr_accessor :linked_in_url}
        friend.linked_in_url = friend_urls[friend.linked_in_user_id]
      end
    end
  end

  private
  def prepare_access_token(service, oauth_token, oauth_token_secret)
    case service.to_sym
      when :twitter
        service_key, service_secret, api_url = TWITTER_KEY, TWITTER_SECRET, "http://api.twitter.com"
      when :linked_in
        service_key, service_secret, api_url = LINKED_IN_KEY, LINKED_IN_SECRET, "http://api.linkedin.com"
    end
    consumer = OAuth::Consumer.new(service_key, service_secret,
      { :site => api_url
    })
    # now create the access token object from passed values
    token_hash = { :oauth_token => oauth_token,
                   :oauth_token_secret => oauth_token_secret
                 }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
    return access_token
  end
  
end
