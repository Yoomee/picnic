class Venue < ActiveRecord::Base
  
  has_many :sessions, :class_name => "ConferenceSession", :dependent => :destroy
  belongs_to :conference
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  named_scope :with_sessions_on_date, lambda {|date| {:joins => :sessions, :conditions => ["DATE(conference_sessions.starts_at) = ?", date], :group => "venues.id"}}
  named_scope :with_sessions_in_year, lambda {|year| {:joins => :sessions, :conditions => ["YEAR(conference_sessions.starts_at) = ?", year], :group => "venues.id"}}
  
end
