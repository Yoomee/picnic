module TramlinesFriends

  def self.included(klass)
    ApplicationController.send(:include, TramlinesFriends::ApplicationControllerExtensions)    
    Member.send(:include, TramlinesFriends::MemberExtensions)    
  end

end