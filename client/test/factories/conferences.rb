Factory.define(:conference) do |f|
  f.ends_on 2.weeks.from_now
  f.name 'A conference'
  f.starts_on 1.week.from_now
end