ActionController::Routing::Routes.draw do |map|

  map.resources :shouts, :as => Shout::ROUTES_NAME, :member => {:share => :get}, :collection => {:older => :get}  
  map.resources :members, :only => [], :member => {:email_preferences => :get, :save_email_preferences => :put}
  
end
