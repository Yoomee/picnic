AdvertCampaign.class_eval do
  
  class << self
    
    def splash_page
      find_or_initialize_by_name('Splash page')
    end
    
  end
  
end