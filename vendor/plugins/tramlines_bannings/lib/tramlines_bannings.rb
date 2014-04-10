module TramlinesBannings
  
  def self.included(klass)
    ApplicationController.send(:include, TramlinesBannings::ApplicationControllerExtensions)
    Member.send(:include, TramlinesBannings::MemberExtensions)
    Notifier.send(:include, TramlinesBannings::NotifierExtensions)
  end
  
end
