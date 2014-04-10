#raise "TramlinesContentFlags requires the inflectious gem. Please add 'config.gem inflectious' to config/environment.rb" unless String.new.respond_to?(:inflections)
%w(controllers helpers models views).each {|path| ActiveSupport::Dependencies.load_once_paths.delete File.join(File.dirname(__FILE__), 'app', path) }
ActiveSupport::Dependencies.load_once_paths.delete File.join(File.dirname(__FILE__), 'lib')
ActiveRecord::Base.class_eval do
  
  class << self
    
    def content_filter(*attrs)
      include(TramlinesContentFilter) unless self.included_modules.include?(TramlinesContentFilter)
      self.filtered_attributes ||= []
      self.filtered_attributes += attrs.flatten.collect(&:to_sym)
    end
    
  end
  
end
