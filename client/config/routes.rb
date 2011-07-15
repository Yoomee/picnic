ActionController::Routing::Routes.draw do |map|
  
  map.resources :conference_delegates, :only => [:index]
  map.resources :conference_sessions, :only => [:create, :edit, :destroy, :show, :update], :member => {:duplicate => :get, :attend => :post, :unattend => :delete}
  map.resources :conferences do |conf|
    conf.resources :conference_sessions, :as => 'sessions', :only => [:show, :new]
    conf.resource :programme, :only => [:show]
    conf.resource :venues, :only => [:show, :new]
  end
  map.resources :front_covers, :member => {:activate => :post, :deactivate => :post}
  map.resources :members, :only => [], :collection => {:admin => :get}
  map.resources :shouts, :only => [], :member => {:remove => :delete, :restore => :put}
  map.resources :subscriptions, :only => [:create, :destroy]
  map.resources :tags, :as => "themes", :collection => {:autocomplete => :get}, :member => {:people => :get}
  map.resources :urls
  map.resources :venues, :only => [:create, :edit, :destroy, :show, :update]
  map.resources :wall_posts, :only => [], :member => {:remove => :delete, :restore => :put}
  
  map.all_time_leaderboard "leaderboard/all_time", :controller => "leaderboard", :action => "all_time"
  map.browse '/browse', :controller => 'browse'
  map.close_beta_bar '/close_beta_bar', :controller => 'home', :action => 'close_beta_bar'
  map.club '/club', :controller => 'club', :action => 'index'
  map.club_rules "/club/rules", :controller => 'club', :action => 'rules'
  map.connections "/connections", :controller => 'club', :action => 'connections'
  map.correspondents '/correspondents', :controller => 'correspondents'
  map.leaderboard "leaderboard", :controller => "leaderboard", :action => "index"
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.member_older_shouts "/member_older_shouts/:id", :controller => 'members', :action => 'older_shouts'
  map.news_network '/newsnetwork', :controller => 'news_network'
  map.news_section_archive '/news/archive', :controller => 'sections', :action => 'show', :id => Section.slug(:news).id, :archive => true
  map.register '/register', :controller => 'members', :action => 'new'
  map.tag_older_shouts "/tag_older_shouts/:id", :controller => 'tags', :action => 'older_shouts'
  map.themes '/themes', :controller => 'tags'
  map.verify_delegate '/delegate/verify/:signature', :controller => 'conference_delegates', :action => 'verify'
  map.what_i_bring "/what_i_bring", :controller => 'members', :action => 'what_i_bring'
  
  map.connect '/delegate/receive', :controller => 'delegate_receiver', :action => 'receive'
  map.connect '/delegate/test', :controller => 'delegate_receiver', :action => 'test'
  map.connect "tags/autocomplete", :controller => "tags", :action => "autocomplete"
  
  map.root :controller => 'sections', :action => 'home'
  
end

