class Conference < ActiveRecord::Base
  include TramlinesImages
  
  validates_presence_of :name
  validate :end_is_on_or_after_start
  
  formatted_date_accessor :starts_on, :ends_on
  
  has_many :sessions, :class_name => "ConferenceSession"
  has_many :venues, :order => "venues.weight"
  
  def day(date_or_time)
    days.index(date_or_time.to_date) + 1
  end
  
  def days
    (starts_on..ends_on).to_a
  end
  
  private
  def end_is_on_or_after_start
    if ends_on < starts_on
      self.errors.add(:formatted_ends_on, "cannot be before the start date.")
    end
  end
  
end
