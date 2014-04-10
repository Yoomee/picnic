Factory.define(:friend_request) do |f|
  f.is_accepted false
  f.association :member, :factory => :member
  f.association :member_target, :factory => :member  
end

Factory.define(:friendship, :parent => :friend_request) do |f|
  f.is_accepted true
end