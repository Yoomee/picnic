class ConferenceSession < ActiveRecord::Base
  include TramlinesImages
  
  belongs_to :venue
  belongs_to :conference
  validates_presence_of :name, :conference, :venue
  validate :time_is_within_conference_dates, :ends_after_start
  
  has_many :conference_sessions_members
  has_many :members, :through => :conference_sessions_members
  has_many :speakers, :through => :conference_sessions_members, :source => :member,  :conditions => "conference_sessions_members.speaker = 1", :order => "TRIM(LEADING '\221t ' from TRIM(LEADING 'den ' from TRIM(LEADING 'der ' from TRIM(LEADING 'de ' from TRIM(LEADING 'van ' FROM members.surname))))), members.forename"
  has_many :attendees, :through => :conference_sessions_members, :source => :member, :conditions => "conference_sessions_members.speaker = 0", :order => "TRIM(LEADING '\221t ' from TRIM(LEADING 'den ' from TRIM(LEADING 'der ' from TRIM(LEADING 'de ' from TRIM(LEADING 'van ' FROM members.surname))))), members.forename"
  
  before_create :duplicate_image
  
  accepts_nested_attributes_for :conference_sessions_members, :allow_destroy => true
  
  acts_as_taggable_on :tags
  
  formatted_time_accessor :starts_at, :ends_at
  
  named_scope :on_date, lambda {|date| {:conditions => ["DATE(conference_sessions.starts_at) = ?", date], :order => "conference_sessions.starts_at"}}
  named_scope :starts_in_hour, lambda {|date| {:conditions => ["HOUR(conference_sessions.starts_at) = ?", date], :order => "conference_sessions.starts_at"}}
  named_scope :ascend_by_time_of_day, :order => "HOUR(conference_sessions.starts_at) ASC"
  
  attr_accessor :duplicate_of

  def conference_day
    conference.days.to_a.index(starts_at.to_date) + 1
  end
  
  def color
    tags.color_not_null.first.try(:color) || '#000000'
  end
  
  def duration_in_hours
    return 1 if starts_at.nil? || ends_at.nil? || starts_at > ends_at
    dur = ((ends_at - starts_at)/3600)
    (dur*12).round.to_f/12
  end
  alias_method :duration, :duration_in_hours
  
  def time_string
    start = starts_at.strftime("%H:%M")
    ends_at.blank? ? start : "#{start} - #{ends_at.strftime("%H:%M")}"
  end
  
  def starts_at_offset(hour)
    return nil if starts_at.nil?
    off = (starts_at.seconds_since_midnight - (hour*3600))/3600
    (off*12).round.to_f/12
  end
  
  private
  def duplicate_image
    return true unless image_uid.blank? && original = ConferenceSession.find_by_id(duplicate_of)
    self.image_uid = original.image_uid
  end

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
