ActionController::Routing::Routes.draw do |map|
  
  map.club '/club', :controller => 'club', :action => 'index'
  map.resources :urls
  map.resources :venues
  map.resources :conference_sessions
  map.resource :programme
  map.resources :tags, :as => "themes", :collection => {:autocomplete => :get}
  
  map.connect '/delegate/receive', :controller => 'delegate_receiver', :action => 'receive'
  map.connect '/delegate/test', :controller => 'delegate_receiver', :action => 'test'
  
  
  map.correspondents '/correspondents', :controller => 'correspondents'
  map.browse '/browse', :controller => 'browse'
  map.themes '/themes', :controller => 'tags'
  map.news_network '/newsnetwork', :controller => 'news_network'
  map.what_i_bring "/what_i_bring", :controller => 'members', :action => 'what_i_bring'
  map.connections "/connections", :controller => 'club', :action => 'connections'
  map.leaderboard "/leaderboard", :controller => 'club', :action => 'leaderboard'
  map.connect "tags/autocomplete", :controller => "tags", :action => "autocomplete"
  
end