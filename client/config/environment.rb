require 'client/lib/delegate_logger'

class ClientEnvironment
  
  class << self
    
    def setup(config)
      config.gem 'searchlogic'
      config.gem 'facebooker2'
      config.gem 'oa-openid', :version => "0.1.6", :lib => "omniauth/openid"
      config.gem 'oa-oauth', :version => "0.1.6", :lib => "omniauth/oauth"
      config.gem 'oa-core', :version => "0.1.6", :lib => "omniauth/core"
      config.gem 'omniauth', :version => "0.1.6"
      config.gem 'linkedin'
      config.gem 'acts_as_textcaptcha', :version => '2.1.3'
      config.gem 'contacts'
      config.gem 'newrelic_rpm'
      config.gem 'geokit'
      
      config.cache_store = :mem_cache_store_with_delete_matched
    end
    
  end
    
end
