ActionController::Routing::Routes.draw do |map|
  
  map.club '/club', :controller => 'club', :action => 'index'
  map.resources :venues
  map.resources :conference_sessions
  map.resource :programme
  map.resources :tags, :as => "themes"
  map.correspondents '/correspondents', :controller => 'correspondents'
  map.browse '/browse', :controller => 'browse'
  map.themes '/themes', :controller => 'tags'
  map.news_network '/newsnetwork', :controller => 'news_network'
  
end