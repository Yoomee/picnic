ActionController::Routing::Routes.draw do |map|

  map.resources :badges, :member => {:info => :get}
  map.resources :members, :only => [] do |member|
    member.resources :badges, :member => {:award => :post, :remove => :delete}, :collection => {:unawarded => :get, :awarded => :get}
    member.resources :points_transfers, :only => [:index]
  end
  map.resources :points_events
 
end