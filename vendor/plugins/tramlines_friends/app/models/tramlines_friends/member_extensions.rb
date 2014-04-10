module TramlinesFriends::MemberExtensions
  
  def self.included(klass)
    klass.acts_as_network :friends, :through => :friend_requests, :conditions =>  ["is_accepted = ?", true]
    klass.after_destroy :destroy_friend_requests
    # klass.named_scope :without_friend_request_to, lambda{|member| {
    #   :joins => "LEFT JOIN friend_requests ON friend_requests.member_id=members.id",
    #   :conditions => ["friend_requests.member_id_target<>?", member.id],
    # }}
    klass.named_scope :without_friend_request_with, lambda{|member| {
      :conditions => ["members.id NOT IN (SELECT member_id AS friend_id FROM friend_requests WHERE member_id_target=? UNION SELECT member_id_target AS friend_id FROM friend_requests WHERE member_id=?)", member.id, member.id]
    }}
  end

  def can_request_friendship_with?(member)
    member != self
  end
  
  def friend_ids
    friends.collect(&:id)
  end
  
  def friend_request_from(member)
    friend_requests_in.find(:first, :conditions => {:member_id => member.id})
  end
  
  def friends_with?(member)
    return true if self == member
    friends.include?(member)
  end
  
  def sent_friend_request_to?(member)
    friend_requests_out.exists?(:member_id_target => member.id, :is_accepted => false)
  end
  
  def has_pending_friend_requests?
    friend_requests_in.exists?(:is_accepted => false)
  end
  
  def has_pending_friend_request_from?(member)
    friend_requests_in.exists?(:member_id => member.id, :is_accepted => false)
  end

  
  private
  def destroy_friend_requests
    friend_requests.each(&:destroy)
  end
  
end