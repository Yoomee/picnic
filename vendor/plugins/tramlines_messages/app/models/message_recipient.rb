class MessageRecipient < ActiveRecord::Base

  belongs_to :message
  belongs_to :member

  named_scope :for_member, lambda{|member| {:conditions => {:member_id => member.id}}}
  named_scope :grouped_by_parent, :joins => :message, :group => "messages.parent_id"
  named_scope :unread, :conditions => {:read => false, :deleted => false}

  attr_accessor :first_time_reading
  
  def read!
    update_attribute(:read, true)
  end
  
  def read
    #return false if updated_at > 10.seconds.ago
    read_attribute(:read)
  end
  alias_method :read?, :read
  
  def un_read!
    update_attribute(:read, false)
  end
  
end