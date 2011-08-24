class ConferenceSessionsMember < ActiveRecord::Base  
  belongs_to :member
  belongs_to :conference_session  
  validates_presence_of :member
end
