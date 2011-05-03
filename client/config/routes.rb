ActionController::Routing::Routes.draw do |map|
  
  map.club '/club', :controller => 'club', :action => 'index'
  map.resources :members, :only => [], :new => {:register => :get}
  map.resources :venues
  
end