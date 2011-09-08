class ClientEnvironment
  
  class << self
    
    def setup_production(config)
      # Only do if *really* production (ie. not staging)
      if false && RAILS_ROOT =~ /picnic_static/
        config.after_initialize do
          Dragonfly::App.send(:apps).each do |app_name, app|
            app.datastore = Dragonfly::DataStorage::S3DataStore.new
            app.datastore.configure do |c|
              #c.bucket_name = RAILS_ENV ==  'staging' ? "bigmouth-staging-#{app_name}" : "bigmouth-#{app_name}"
              c.bucket_name = "picnic-#{app_name}"
              c.access_key_id = "AKIAJC5MUJGGJC6YYRDQ"
              c.secret_access_key = "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"
            end
          end
        end
      end
    end
    
  end
  
end