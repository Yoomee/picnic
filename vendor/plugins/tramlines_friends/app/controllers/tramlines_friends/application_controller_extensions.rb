module TramlinesFriends::ApplicationControllerExtensions
  
  def self.included(klass)
    klass.extend ClassMethods
    klass.class_eval do
      class << self
        alias_method_chain :allowed_to?, :friends
      end
    end
  end

  module ClassMethods
  
    def allowed_to_with_friends?(url_options, member)
      if friend_only_action?(url_options[:action])
        return false if member.nil?
        return true if member.is_admin?
        assoc_model = associated_model_instance(url_options[:id])
        owner = assoc_model.is_a?(Member) ? assoc_model : assoc_model.member
        member.friends_with?(owner)
      else
        allowed_to_without_friends?(url_options, member)
      end
    end
    
  end
  
end