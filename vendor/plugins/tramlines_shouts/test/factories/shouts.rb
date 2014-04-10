Factory.define(:shout) do |f|
  f.created_at Time.now
  f.association :member, :factory => :member
  f.text "This is a shout"
  f.updated_at Time.now
end
