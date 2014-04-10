ActionController::Routing::Routes.draw do |map|

  map.resources :messages, :collection => {:sent => :get, :destroy_selected_messages => :post, :set_messages_to_read => :post, :set_messages_to_unread => :post}
 
end