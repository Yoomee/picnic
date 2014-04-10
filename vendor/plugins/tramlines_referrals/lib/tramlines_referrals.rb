# TramlinesReferrals
module TramlinesReferrals
  
  def self.included(klass)
    Notifier.send(:include, TramlinesReferrals::NotifierExtensions)
    MembersController.send(:include, TramlinesReferrals::MembersControllerExtensions)
  end
  
end