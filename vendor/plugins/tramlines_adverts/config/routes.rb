ActionController::Routing::Routes.draw do |map|

  map.resources :adverts, :member => {:click => :get}
  map.resources :advert_campaigns do |advert_campaign|
    advert_campaign.resources :adverts
  end
 
end