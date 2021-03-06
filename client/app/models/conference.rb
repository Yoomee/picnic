class Conference < ActiveRecord::Base
  include TramlinesImages
  
  validates_presence_of :name
  validate :end_is_on_or_after_start
  
  formatted_date_accessor :starts_on, :ends_on
  
  has_many :sessions, :class_name => "ConferenceSession"
  has_many :venues, :order => "venues.weight"

  before_save :bump_version
  
  def bump_version!
    self.update_attribute(:version, latest_version + 1)
  end
  
  def day(date_or_time)
    days.index(date_or_time.to_date) + 1
  end
  
  def days
    (starts_on..ends_on).to_a
  end
  
  private
  def bump_version
    self.version = (latest_version + 1) unless changed.include?("version")
  end
  
  def end_is_on_or_after_start
    if ends_on < starts_on
      self.errors.add(:formatted_ends_on, "cannot be before the start date.")
    end
  end

  def latest_version
    # also checks for latest version across all previous conferences
    Conference.created_at_lte(created_at || Time.now).maximum(:version) || 0
  end
  
end
