class ConnectionSet
  
  cattr_accessor :connection_classes
  
  def connections
    batch = self.class::connection_classes.inject([]) do |memo, connection_class|
      memo + connection_class.send(:get_for, @member, @options)
    end
    prune([], batch, @limit)
  end

  def initialize(member, options = {})
    @limit = options[:limit]
    @member, @options = member, options
  end
  
  private
  def prune(out, batch, limit, existing_members = [])
    # Randomize and ensure no members are duplicated
    return out if limit == 0 || batch.empty?
    candidate = batch.remove_one_at_random!
    if existing_members.include?(candidate.member)
      # discard candidate
      prune(out, batch, limit, existing_members)
    else
      existing_members << candidate.member
      out << candidate
      limit = limit.nil? ? nil : limit - 1
      prune(out, batch, limit, existing_members)
    end
  end    
  
end

ConnectionSet::connection_classes = [FriendOfAFriendConnection, TwitterFriendConnection, LinkedInFriendConnection, FacebookFriendConnection]