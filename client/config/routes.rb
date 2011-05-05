ActionController::Routing::Routes.draw do |map|
  
  map.club '/club', :controller => 'club', :action => 'index'
  map.resources :venues
  map.resources :tags, :as => "themes"
  
end