require 'client/lib/delegate_logger'

class ClientEnvironment
  
  class << self
    
    def setup(config)
      config.gem 'searchlogic'
      config.gem 'facebooker2'
      config.gem 'oa-basic', :version => '0.1.6', :lib => 'omniauth/basic'
      config.gem 'oa-openid', :version => "0.1.6", :lib => "omniauth/openid"
      config.gem 'oa-oauth', :version => "0.1.6", :lib => "omniauth/oauth"
      config.gem 'oa-core', :version => "0.1.6", :lib => "omniauth/core"
      config.gem 'omniauth', :version => "0.1.6"
      config.gem 'linkedin'
      config.gem 'acts_as_textcaptcha', :version => '2.1.3'
      config.gem 'contacts'
      config.gem 'newrelic_rpm'
      config.gem 'geokit'
      config.gem 'googlecharts'     
      config.gem 'inflectious'
      config.gem 'acts_as_list', :version => '0.1.4'
      config.gem 'encryptor'
      unless RAILS_ENV=='test'
        config.gem 'factory_girl', :version => '1.3.3'
        config.gem 'lorem'
        config.gem "mocha"
      end
      config.gem "sqlite3"
      #config.cache_store = :mem_cache_store_with_delete_matched
      config.cache_store = :file_store, "#{RAILS_ROOT}/tmp/cache"
      config.time_zone = "Amsterdam"
    end
    
  end
    
end
