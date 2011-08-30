Factory.define(:venue) do |f|
  f.name "A venue"
  f.association :conference
end