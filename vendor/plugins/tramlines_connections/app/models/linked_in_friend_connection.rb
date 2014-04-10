class LinkedInFriendConnection < Connection

  extend Forwardable
  
  def_delegator :@member, :linked_in_url
  
  class << self

    private
    def args_for_initialize(member, options = {})
      linked_in_friends = member.linked_in_friends
      return [] if linked_in_friends.empty?
      linked_in_friends
    end

  end
  
  def initialize(linked_in_friend)
    @member = linked_in_friend
  end
  
end