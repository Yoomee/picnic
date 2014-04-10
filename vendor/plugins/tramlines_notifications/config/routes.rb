ActionController::Routing::Routes.draw do |map|

  map.resources :notifications, :only => [:index, :destroy]
 
end