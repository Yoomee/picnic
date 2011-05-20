Member::WHAT_I_BRING_MAX_LENGTH = 100
Member::NEWS_FEED_FIELD_BLACKLIST = %w{bio}
Member.class_eval do

  has_permalink

  add_to_news_feed :on_update => true

  def skip_news_feed_with_field_blacklist
    skip_news_feed_without_field_blacklist || changed.all? {|attr| attr.in?(Member::NEWS_FEED_FIELD_BLACKLIST)}
  end
  alias_method_chain :skip_news_feed, :field_blacklist

  attr_boolean_accessor :skip_what_i_bring_validation
  
  acts_as_taggable_on :tags
  
  has_location  
  has_many :urls, :as => :attachable
  
  validates_length_of :what_i_bring, :maximum => Member::WHAT_I_BRING_MAX_LENGTH, :on => :update, :allow_blank => true
  validates_presence_of :what_i_bring, :on => :update, :unless => Proc.new {|member| member.force_password_change? || member.skip_what_i_bring_validation?}
  
  accepts_nested_attributes_for :urls
  
  # validates_presence_of :country, :unless => Proc.new {|member| !member.new_record? || member.twitter_connected? || member.linked_in_connected? || member.facebook_connected?}
  
  def country
    location.country
  end
  
  def country=(val)
    location.country = val
  end
  
  def generate_random_password(force = false)
    if password.blank? && (force || twitter_connected? || facebook_connected? ||linked_in_connected?)
      self.password = self.class::generate_password
      self.password_generated = true
    end
  end
  
end