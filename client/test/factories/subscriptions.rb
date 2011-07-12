Factory.define(:subscription) do |f|
  f.association :member, :factory => :member
end