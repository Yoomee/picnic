class Advert < ActiveRecord::Base

  include TramlinesImages
  
  belongs_to :campaign, :class_name => "AdvertCampaign"
  
  validates_numericality_of :impression_count, :max_impression_count, :click_count, :max_click_count, :allow_nil => true, :greater_than_or_equal_to => 0, :only_integer => true
  validates_order_of :active_from, :active_until, :message => "The start date must be before the end date."
  validates_presence_of :campaign, :name, :url, :image
  validates_url_format_of :url

  class << self
    
    def active
      all.select(&:active?)
    end
    
  end
  
  def active?
    !reached_max_click_count? && !reached_max_impression_count? && !outside_active_dates?
  end
  
  def has_active_dates?
    !active_from.blank? || !active_until.blank?
  end
  
  def has_max_click_count?
    !max_click_count.blank? && !max_click_count.zero?
  end
  
  def has_max_impression_count?
    !max_impression_count.blank? && !max_impression_count.zero?
  end
  
  def outside_active_dates?
    return false if !has_active_dates?
    (!active_from.blank? && Date.today < active_from.to_date) || (!active_until.blank? && Date.today >= active_until.to_date)
  end
  
  def reached_max_click_count?
    has_max_click_count? && (click_count >= max_click_count)
  end
  
  def reached_max_impression_count?
    has_max_impression_count? && (impression_count >= max_impression_count)
  end
  
  def to_s
    name
  end
  
  def url=(value)
    value = 'http://' + value unless value.blank? || value =~ /^http/
    write_attribute(:url, value.to_s.strip)
  end
  
  def url_external?
    !url.match(/^#{APP_CONFIG['site_url']}/)
  end
  
end
