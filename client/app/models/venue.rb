class Venue < ActiveRecord::Base
  
  has_many :sessions, :class_name => "ConferenceSession", :dependent => :destroy
  belongs_to :conference
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  after_save :bump_program_version
  after_destroy :bump_program_version
  
  named_scope :with_sessions, :joins => :sessions, :group => "venues.id"
  named_scope :with_sessions_on_date, lambda {|date| {:joins => :sessions, :conditions => ["DATE(conference_sessions.starts_at) = ?", date], :group => "venues.id"}}
  
  def as_json(options = nil)
    {
      :id => id,
      :name => name.to_s.toutf8,
      :order => weight
    }.as_json(options)
  end
  
  private
  def bump_program_version
    conference.bump_version!
  end
  
end
