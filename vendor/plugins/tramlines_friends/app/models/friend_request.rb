class FriendRequest < ActiveRecord::Base
  
  belongs_to :member
  belongs_to :member_target, :class_name => 'Member', :foreign_key => "member_id_target"
  
  validates_presence_of :member
  validates_presence_of :member_target  
  validates_uniqueness_of :member_id, :scope => :member_id_target
  
  has_notification

  class << self
    
    def exists_between?(member1, member2)
      exists?(:member_id => member1.id, :member_id_target => member2.id) || exists?(:member_id => member2.id, :member_id_target => member1.id)
    end
    
  end
  
  def <=>(other_req)
    other_req.accepted_at.to_i <=> self.accepted_at.to_i
  end
  
  def accept!
    if !is_accepted? && update_attributes(:is_accepted => true, :accepted_at => Time.now)
      member.notifications.create(:text => "<a href='/members/#{member_id_target}'>#{member_target}</a> has accepted your friend request.")
    end
    notification.destroy if notification && is_accepted?
    is_accepted?
  end
  
  def friend_of(mem)
    member==mem ? member_target : member
  end
  
  private
  def save_notification
    self.create_notification(:member => member_target)
  end
  
end