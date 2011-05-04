Factory.redefine(:future_event, :class => Event) do |e|
  e.end_at 2.hours.from_now
  e.association(:page)
  e.start_at 1.hour.from_now
  e.association :venue
end

Factory.redefine(:past_event, :class => Event) do |e|
  e.end_at 13.hours.ago
  e.association(:page)
  e.start_at 1.day.ago
  e.association(:venue)
end
