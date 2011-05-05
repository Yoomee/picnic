ActionController::Routing::Routes.draw do |map|
  
  map.club '/club', :controller => 'club', :action => 'index'
  map.resources :venues
  map.resources :tags, :as => "themes"
  map.correspondents '/correspondents', :controller => 'correspondents'
  
end