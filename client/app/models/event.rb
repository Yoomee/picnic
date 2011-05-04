Event.class_eval do
  
  belongs_to :venue
  validates_presence_of :venue_id
  
end