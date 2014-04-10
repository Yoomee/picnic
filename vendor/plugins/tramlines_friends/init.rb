ActionController::Base.class_eval do
  
  class << self
    
    def default_friend_only_action?(action)
      permission_level_default(action.to_sym) == :friend_only
    end
    
    def friend_only(*actions)
      set_permission_levels(actions, :friend_only)
    end
  
    def friend_only_action?(action)
      permission_level(action.to_sym) == :friend_only
    end
  
  end

  def default_friend_only_action?(action)
    self.class::default_friend_only_action?(action)
  end

  def friend_only_action?(action)
    self.class::friend_only_action?(action)
  end

end

%w(controllers helpers models views).each {|path| ActiveSupport::Dependencies.load_once_paths.delete File.join(File.dirname(__FILE__), 'app', path) }
ActiveSupport::Dependencies.load_once_paths.delete File.join(File.dirname(__FILE__), 'lib')