ActionController::Base.class_eval do
  
  class << self
    
    def skip_badge_announcement(*args)
      before_filter :set_skip_badge_announcement, :only => args
      send(:define_method, "set_skip_badge_announcement") do
        @skip_badge_announcement = true
      end
    end

  end

end

%w(controllers helpers models views).each {|path| ActiveSupport::Dependencies.load_once_paths.delete File.join(File.dirname(__FILE__), 'app', path) }
ActiveSupport::Dependencies.load_once_paths.delete File.join(File.dirname(__FILE__), 'lib')