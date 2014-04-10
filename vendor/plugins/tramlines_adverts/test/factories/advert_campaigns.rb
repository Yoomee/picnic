Factory.define(:advert_campaign) do |f|
  f.sequence(:name) {|n| "Advert Campaign #{n}"}
end