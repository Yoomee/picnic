Member::WHAT_I_BRING_MAX_LENGTH = 100
Member::NEWS_FEED_FIELD_BLACKLIST = %w{bio}
Member::API_SECRET = "'?8vR3Y?hYM#T@i7-(isU!7AQ8FVQyT"
Member.class_eval do

  acts_as_textcaptcha({
    'questions' => Picnic::SPAM_QUESTIONS
  })

  add_to_news_feed :on_update => true

  attr_boolean_accessor :skip_what_i_bring_validation
  
  acts_as_taggable_on :tags
  
  before_save :associate_with_delegate
  after_save :save_delegate
  after_save :add_real_me_points
  
  after_create :trigger_points_event
  before_update :set_location_from_ip_address
  
  rateable_by_member
  has_location
  has_many :urls, :as => :attachable, :dependent => :destroy
  has_one :conference_delegate, :autosave => true, :dependent => :destroy
  
  has_many :conference_sessions_members, :dependent => :destroy, :uniq => true
  has_many :conference_sessions, :through => :conference_sessions_members, :order => "conference_sessions.starts_at", :uniq => true
  has_many :conference_sessions_speaking_at, :through => :conference_sessions_members, :source => :conference_session, :conditions => "conference_sessions_members.speaker = 1 AND conference_sessions_members.attending = 1", :order => "conference_sessions.starts_at", :uniq => true
  has_many :conference_sessions_attending, :through => :conference_sessions_members, :source => :conference_session, :conditions => "conference_sessions_members.speaker = 0 AND conference_sessions_members.attending = 1", :order => "conference_sessions.starts_at", :uniq => true
  
  has_many :subscriptions, :dependent => :destroy
  has_many :subscription_items, :class_name => "Subscription", :as => :attachable, :dependent => :destroy
  has_many :subscribers, :through => :subscription_items, :source => :member

  # non-banned members with what_i_bring set and with profile tags (unless they registered before 1/10/2011)
  named_scope :active, :conditions => ["banned_at IS NULL AND what_i_bring > '' AND what_i_bring <> '...' AND (members.created_at < ? OR EXISTS (SELECT * FROM taggings WHERE taggings.taggable_type = 'Member' AND taggings.taggable_id = members.id))", Date.new(2011, 10, 1)], :group => "members.id"
  named_scope :with_theme_tag, lambda{|tag| {:joins => "INNER JOIN shouts ON shouts.member_id=members.id INNER JOIN taggings ON taggings.taggable_id=shouts.id", :conditions => ["taggings.taggable_type='Shout' AND taggings.tag_id=?", tag.id], :group => "members.id"}}
  named_scope :subscribed_to_tags, lambda{|tags| {:joins => :subscriptions, :conditions => ["(subscriptions.attachable_type = 'Tag' OR subscriptions.attachable_type = 'ActsAsTaggableOn::Tag') AND subscriptions.attachable_id IN (?)", tags.collect(&:id)], :group => "members.id"}}
  named_scope :subscribed_to_member, lambda{|member| {:joins => :subscriptions, :conditions => ["subscriptions.attachable_type = 'Member' AND subscriptions.attachable_id = ?", member.id], :group => "members.id"}}
  
  named_scope :alphabetically, :order => "TRIM(LEADING '‘t ' from TRIM(LEADING 'den ' from TRIM(LEADING 'der ' from TRIM(LEADING 'de ' from TRIM(LEADING 'van ' FROM members.surname))))), members.forename"
  
  validates_presence_of :email, :unless => :allow_username_instead_of_email?
  
  validates_length_of :what_i_bring, :maximum => Member::WHAT_I_BRING_MAX_LENGTH, :on => :update, :allow_blank => true
  validates_presence_of :what_i_bring, :on => :update, :unless => Proc.new {|member| member.force_password_change? || member.skip_what_i_bring_validation?}
  
  accepts_nested_attributes_for :urls
  
  # validates_presence_of :country, :unless => Proc.new {|member| !member.new_record? || member.twitter_connected? || member.linked_in_connected? || member.facebook_connected?}

  class << self
    def find_by_api_key(api_key)
      return nil if api_key.blank?
      find_by_id(
        Encryptor.decrypt(
          Base64.decode64(api_key.tr("-_","+/")),
          :key => Digest::SHA256.hexdigest(Member::API_SECRET)
        )
      )
    end
    
    def with_theme_or_member_tag(tag)
      (with_theme_tag(tag) + Member.tagged_with(tag)).uniq.randomize
    end
    
    def show_admins_on_leaderboard
      true
    end
    
  end
  
  def as_json_with_api(options = nil)
    if options[:api]
      {
        :id => id,
        :forename => forename.to_s,
        :surname => surname.to_s,
        :bio => bio.to_s.strip_tags,
        :is_speaker => true,
        :session_ids => conference_sessions_speaking_at_ids
      }.as_json(options)
    else
      as_json_without_api(options)
    end
  end
  alias_method_chain :as_json, :api
  
  def allowed_job_title?
    has_badge?(:picnic11_speaker) || has_badge?(:picnic11_team) || has_badge?(:picnic_advisor)
  end
  
  def api_key
    Base64.encode64(
      Encryptor.encrypt(
        id.to_s,
        :key => Digest::SHA256.hexdigest(Member::API_SECRET)
      )
    ).strip.tr("+/","-_")
  end
  
  def attending?(session)
    session.attendees.all.include?(self)
  end
  
  def speaking_at?(session)
    session.speakers.all.include?(self)
  end
  
  
  def blank_what_i_bring?
    what_i_bring.blank? || what_i_bring == '...'
  end
  
  def color
    tags.color_not_null.first.try(:color) || '#E45C96'
  end
  
  def conference_delegate_id
    conference_delegate.try(:id)
  end
  
  def conference_delegate_id=(val)
    cd = ConferenceDelegate.find_by_id(val)
    self.conference_delegate = cd unless cd.nil? || (cd.member_id != self && !cd.member_id.nil?)
  end
  
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
  
  def initialize_with_default_what_i_bring(attrs = {})
    initialize_without_default_what_i_bring(attrs.reverse_merge(:what_i_bring => '...'))
  end
  alias_method_chain :initialize, :default_what_i_bring
  
  def skip_news_feed_with_field_blacklist
    skip_news_feed_without_field_blacklist || changed.all? {|attr| attr.in?(Member::NEWS_FEED_FIELD_BLACKLIST)}
  end
  alias_method_chain :skip_news_feed, :field_blacklist
  
  def subscription_for(attachable)
    subscriptions.find_by_attachable_type_and_attachable_id(attachable.class.to_s, attachable.id)
  end

  def tags_subscribed_to
    subscriptions.attachable_type_is('Tag').collect(&:attachable)
  end

  def tags_with_other_members
    tags.select {|tag| Member.tagged_with(tag.name).size > 1}
  end

  private  
  def add_real_me_points
    unless tags.empty? || has_points_transfer?(:set_real_me_tags) || @adding_real_me_points
      @adding_real_me_points = true
      handle_points_event(:set_real_me_tags, self, {}) 
    end
  end
  
  def associate_with_delegate
    if conference_delegate.nil? && (new_record? || changed?(&:email))
      if del = ConferenceDelegate.find_by_email_and_member_id(email, nil)
        self.conference_delegate = del
      end
    end
  end
  
  def save_delegate
    unless conference_delegate.nil?
      conference_delegate.save!
      conference_delegate.add_badge
    end
  end
  
  def trigger_points_event(options = {})
    self.handle_points_event(:register, self, options)
  end
  
  def set_location_from_ip_address
    return true if ip_address.blank? || !changed.include?("ip_address") || !location.unknown?
    self.location = Location.from_ip_address(ip_address)
  end
  
end
