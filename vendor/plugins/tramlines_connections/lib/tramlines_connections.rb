# TramlinesConnections
module TramlinesConnections
  
  def self.included(klass)
    Member.send(:include, TramlinesConnections::MemberExtensions)
    FriendRequest.send(:include, TramlinesConnections::FriendRequestExtensions)
  end
  
end
