class ConferenceSessionsMember < ActiveRecord::Base  
  belongs_to :member
  belongs_to :conference_sessions
  
end