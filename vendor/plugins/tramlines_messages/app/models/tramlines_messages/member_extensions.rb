module TramlinesMessages::MemberExtensions
  
  def self.included(klass)
    klass.has_many :sent_messages, :class_name => "Message"
    klass.has_many :message_recipients, :conditions => {:deleted => false}
    klass.has_many :messages, :through => :message_recipients
  end
  
  def has_unread_messages?
    !unread_message_count.zero?
  end
  
  def unread_message_count
    message_recipients.grouped_by_parent.unread.count
  end
  
end