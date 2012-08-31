class ConferenceSession < ActiveRecord::Base
  include TramlinesImages
  
  belongs_to :venue
  belongs_to :conference
  validates_presence_of :name, :conference, :venue
  validate :time_is_within_conference_dates, :ends_after_start
  
  has_many :conference_sessions_members, :conditions => "conference_sessions_members.attending = 1"
  has_many :members, :through => :conference_sessions_members
  has_many :speakers, :through => :conference_sessions_members, :source => :member,  :conditions => "conference_sessions_members.speaker = 1", :order => "TRIM(LEADING '\221t ' from TRIM(LEADING 'den ' from TRIM(LEADING 'der ' from TRIM(LEADING 'de ' from TRIM(LEADING 'van ' FROM members.surname))))), members.forename", :uniq => true
  has_many :attendees, :through => :conference_sessions_members, :source => :member, :conditions => "conference_sessions_members.speaker = 0", :order => "TRIM(LEADING '\221t ' from TRIM(LEADING 'den ' from TRIM(LEADING 'der ' from TRIM(LEADING 'de ' from TRIM(LEADING 'van ' FROM members.surname))))), members.forename", :uniq => true
  has_many :shouts, :as => :recipient, :dependent => :destroy
  
  before_create :duplicate_image
  after_save :bump_program_version
  after_destroy :bump_program_version  
  
  accepts_nested_attributes_for :conference_sessions_members, :allow_destroy => true
  
  acts_as_taggable_on :tags
  
  formatted_time_accessor :starts_at, :ends_at
  
  named_scope :on_date, lambda {|date| {:conditions => ["DATE(conference_sessions.starts_at) = ?", date], :order => "conference_sessions.starts_at"}}
  named_scope :starts_in_hour, lambda {|date| {:conditions => ["HOUR(conference_sessions.starts_at) = ?", date], :order => "conference_sessions.starts_at"}}
  named_scope :ascend_by_time_of_day_and_venue, :joins => :venue, :order => "TIME(conference_sessions.starts_at), venues.weight"
  named_scope :with_tags, :joins => :taggings, :group => "conference_sessions.id"
  
  attr_accessor :duplicate_of

  def as_json(options = nil)
    {
      :id => id,
      :name => name.to_s,
      :text => description.to_s.strip_tags,
      :venue_id => venue_id,
      :day => conference_day,
      :starts_at => "%9.5f" % starts_at.to_f,
      :ends_at => "%9.5f" % ends_at.to_f,
      :timestamp => "%9.5f" % created_at.to_f
    }.merge(color_hash).as_json(options)
  end
  
  def attend!(member)
    csm = ConferenceSessionsMember.find_or_initialize_by_conference_session_id_and_member_id_and_speaker(self.id, member.id, false)
    csm.attending = true
    csm.save
  end
  
  def unattend!(member)
    if csm = ConferenceSessionsMember.find_by_conference_session_id_and_member_id_and_speaker(self.id, member.id, false)
      csm.update_attribute(:attending, false)
    end
  end
  
  def conference_day
    conference.days.to_a.index(starts_at.to_date) + 1
  end
  
  def color
    tags.color_not_blank.first.try(:color) || '#000000'
  end
  
  def color_hash
    Tag::color_hash(color)
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
  def bump_program_version
    conference.bump_version!
  end
  
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
