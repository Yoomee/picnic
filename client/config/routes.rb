ActionController::Routing::Routes.draw do |map|
  
  map.resource :programme

  map.resources :conference_sessions
  map.resources :tags, :as => "themes", :collection => {:autocomplete => :get}
  
  map.connect '/delegate/receive', :controller => 'delegate_receiver', :action => 'receive'
  map.connect '/delegate/test', :controller => 'delegate_receiver', :action => 'test'
  map.verify_delegate '/delegate/verify/:signature', :controller => 'conference_delegates', :action => 'verify'
  map.resources :conference_delegates, :only => [:index]
  
  map.leaderboard "leaderboard", :controller => "leaderboard", :action => "index"
  map.resources :urls
  map.resources :venues

  map.all_time_leaderboard "leaderboard/all_time", :controller => "leaderboard", :action => "all_time"
  map.browse '/browse', :controller => 'browse'
  map.club '/club', :controller => 'club', :action => 'index'
  map.connections "/connections", :controller => 'club', :action => 'connections'
  map.correspondents '/correspondents', :controller => 'correspondents'
  map.leaderboard "leaderboard", :controller => "leaderboard", :action => "index"
  map.member_older_shouts "/member_older_shouts/:id", :controller => 'members', :action => 'older_shouts'
  map.news_network '/newsnetwork', :controller => 'news_network'
  map.themes '/themes', :controller => 'tags'
  map.what_i_bring "/what_i_bring", :controller => 'members', :action => 'what_i_bring'
  
  map.connect "tags/autocomplete", :controller => "tags", :action => "autocomplete"
  
  map.root :controller => 'sections', :action => 'home'
  
end

