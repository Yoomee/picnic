ActionController::Routing::Routes.draw do |map|

  map.resources :referrals, :new => {:contacts => :get}
 
end