class ConferenceSession < ActiveRecord::Base
  
  belongs_to :venue  
  validates_presence_of :name
  
  named_scope :on_date, lambda {|date| {:conditions => ["DATE(conference_sessions.starts_at) = ?", date]}}
  named_scope :starts_in_hour, lambda {|date| {:conditions => ["HOUR(conference_sessions.starts_at) = ?", date]}}
  
end
