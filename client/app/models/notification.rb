Notification.class_eval do
  
  belongs_to :from_member, :class_name => 'Member'
  
end