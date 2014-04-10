Factory.define(:notification) do |n|
  n.association :member, :factory => :member
end