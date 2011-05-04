class ClientEnvironment
  
  class << self
    
    def setup(config)
      config.gem 'searchlogic'
      config.gem 'facebooker2'
      config.gem 'oa-openid', :version => "0.1.6", :lib => "omniauth/openid"
      config.gem 'oa-oauth', :version => "0.1.6", :lib => "omniauth/oauth"
      config.gem 'oa-core', :version => "0.1.6", :lib => "omniauth/core"
      config.gem 'omniauth', :version => "0.1.6"
    end
    
  end
    
end
