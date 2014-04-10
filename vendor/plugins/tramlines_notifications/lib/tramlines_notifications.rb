module TramlinesNotifications
  
  def self.included(klass)
    Member.send(:include, TramlinesNotifications::MemberExtensions)
    Notifier.send(:include, TramlinesNotifications::NotifierExtensions)
  end
  
  module HasNotification
    
    def self.included(klass)
      klass.has_one :notification, :as => :attachable, :dependent => :destroy
      klass.after_create :save_notification
    end
    
    private
    # overwrite this in model to save correct notification details
    # create a notifier view using "notifier/notifications/#{class_name}" (e.g. notifier/notifications/friend_request.text.html.haml)
    # this will be used instead of the default notification email
    def save_notification
      self.create_notification(:member => member)
      true
    end
    
  end
  
end
