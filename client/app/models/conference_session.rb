class ConferenceSession < ActiveRecord::Base
  include TramlinesImages
  
  belongs_to :venue
  belongs_to :conference
  validates_presence_of :name, :conference, :venue
  validate :time_is_within_conference_dates, :ends_after_start
  
  has_many :conference_sessions_members
  has_many :members, :through => :conference_sessions_members
  
  accepts_nested_attributes_for :conference_sessions_members, :allow_destroy => true
  
  formatted_time_accessor :starts_at, :ends_at
  
  named_scope :on_date, lambda {|date| {:conditions => ["DATE(conference_sessions.starts_at) = ?", date], :order => "conference_sessions.starts_at"}}
  named_scope :starts_in_hour, lambda {|date| {:conditions => ["HOUR(conference_sessions.starts_at) = ?", date], :order => "conference_sessions.starts_at"}}


  def conference_day
    conference.days.to_a.index(starts_at.to_date) + 1
  end
  
  private
  def time_is_within_conference_dates
    return true if conference.nil?
    err_mess = "must be between #{conference.starts_on.strftime("%d/%m/%y")} and #{conference.ends_on.strftime("%d/%m/%y")}"
    %w{starts_at ends_at}.each do |time|
      if send(time).to_date < conference.starts_on
        self.errors.add("formatted_#{time}", err_mess)
      elsif send(time).to_date > conference.ends_on
        self.errors.add("formatted_#{time}", err_mess)
      end
    end
  end
  
  def ends_after_start
    if ends_at <= starts_at
      self.errors.add(:formatted_ends_at, "must be after the start time.")
    end
  end
  
end
