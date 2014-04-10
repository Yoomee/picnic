module TramlinesShouts
  
  def self.included(klass)
    WallPostsController.send(:include, TramlinesShouts::WallPostsControllerExtensions)
    MembersController.send(:include, TramlinesShouts::MembersControllerExtensions)
    Member.send(:include, TramlinesShouts::MemberExtensions)
    WallPost.send(:include, TramlinesShouts::WallPostExtensions)
    Notifier.send(:include, TramlinesShouts::NotifierExtensions)
    Notification.send(:include, TramlinesShouts::NotificationExtensions)
    # For some reason applying this to ActsAsTaggableOn::Tag, doesn't work,
    # so we'll apply it to Tag, if it exists for the project.
    begin
      Tag.send(:include, TramlinesShouts::TagExtensions)
    rescue NameError
      # Presumably Tag isn't defined
    end      
  end
  
end