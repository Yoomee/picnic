ActionController::Routing::Routes.draw do |map|

  map.resources :slideshows, :member => {:order => :get, :update_weights => :post}
  
 
end