module TramlinesPicnicAuth
  
  def self.included(klass)
    MembersController.send(:include, TramlinesPicnicAuth::MembersControllerExtensions)
    SessionsController.send(:include, TramlinesPicnicAuth::SessionsControllerExtensions)
  end
  
end
