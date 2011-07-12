FriendRequest.class_eval do

  def accept!
    if !is_accepted? && update_attributes(:is_accepted => true, :accepted_at => Time.now)
      member.notifications.create(:text => "<a href='/members/#{member_id_target}'>#{member_target}</a> is now sitting on your blanket.", :from_member => member_target)
    end
    notification.destroy if notification && is_accepted?
    is_accepted?
  end
  
end