ActionController::Routing::Routes.draw do |map|

  map.resources :content_flags, :member => {:remove => :delete, :resolve => :put, :restore => :put, :unresolve => :put}, :collection => {:resolved => :get, :inbox => :get}
  map.resources :content_flaggings
  map.resources :content_filter_words
  map.resources :content_flag_types
  map.moderation "/moderation", :controller => "content_flags"
  map.connect ":attachable_type/:attachable_id/content_flaggings/new", :controller => "content_flaggings", :action => "new"
 
end