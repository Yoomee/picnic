ActionController::Routing::Routes.draw do |map|

  map.resources :members, :only => [] do |member|
    member.resources :friends, :collection => {:index => :any}
  end
  map.resources :friend_requests, :member => {:accept => :put}
 
end