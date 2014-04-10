module TramlinesBadges::MemberExtensions
  
  def self.included(klass)
    klass.has_many :badge_awardings, :dependent => :destroy
    klass.has_many :badges, :through => :badge_awardings
    klass.has_many :points_transfers, :dependent => :destroy
    klass.named_scope :with_badge, lambda {|ref| {:joins => :badges, :conditions => ["badges.ref = ?", ref.to_s]}}
    klass.named_scope :ranked, lambda {{:order => "points DESC", :conditions => klass.show_admins_on_leaderboard ? 'points > 0' : "is_admin = 0 AND points > 0"}}
    klass.named_scope :ranked_since, lambda {|date| {
      :select => "members.*, SUM(points_transfers.points) AS points",
      :joins => "INNER JOIN points_transfers ON (points_transfers.member_id = members.id AND points_transfers.created_at >= '#{date.to_date}')",
      :conditions => klass.show_admins_on_leaderboard ? '' : "is_admin = 0",
      :group => "members.id",
      :order => "points DESC"
    }}
    klass.extend ClassMethods
  end
  
  module ClassMethods
    
    # overwrite in client
    # keys = name of trigger, used to generate drop-down on badges#form
    # values = amount used to see if member should be awarded badge
    # e.g. {:points => Proc.new {|m| m.points}}    
    # call member.handle_badge_trigger(:points) when you want to try and award member badges with a :points trigger
    def badge_triggers
      {:points => Proc.new {|m| m.points},
       :actions => Proc.new {|m| m.points_transfers.count}}
    end
    
    # overwrite in client
    def show_admins_on_leaderboard
      false
    end
    
  end
  
  def amount_for_badge_trigger(trigger_name)
    if proc = self.class::badge_triggers[trigger_name.try(:to_sym)]
      proc.call(self)
    end
  end
  
  def award_badge!(badge_ref)
    badge_ref = badge_ref.to_s
    if !has_badge?(badge_ref)
      self.badges << Badge.find_by_ref(badge_ref)
    end
  end
  
  # pass array of badges or array badge_refs
  def award_badges!(new_badges)
    return true if new_badges.empty?
    if !new_badges.first.is_a?(Badge)
      new_badges = Badge.find(:all, :conditions => ["ref IN (?)", new_badges])
    end
    self.badges += (new_badges - self.badges)
  end
  
  def awarded_date_for_badge(badge)
    if badge_awarding = badge_awardings.find_by_badge_id(badge.id)
      badge_awarding.created_at
    else
      nil
    end
  end
  
  def handle_all_badge_triggers
    self.class::badge_triggers.keys.each {|trigger_name| handle_badge_trigger(trigger_name)}
  end
  
  def handle_badge_trigger(trigger_name)
    if amount = amount_for_badge_trigger(trigger_name)
      award_badges!(Badge.for_trigger(trigger_name.to_s, amount))
    end
  end
  
  def handle_points_event(slug_name, attachable, options = {})
    if points_event = PointsEvent.find_by_slug(slug_name.to_s)
      self.increment!(:points, points_event.points)
      handle_badge_trigger(:points)
      self.points_transfers.create(options.merge(:points_event => points_event, :attachable => attachable))      
    end
  end
  
  def has_badge?(badge)
    if badge.is_a?(Badge)
      badges.exists?(:id => badge.id)
    else
      badges.exists?(:ref => badge.to_s)
    end
  end
  
  def has_points_transfer?(slug)
    points_transfers.map(&:points_event).map(&:slug).include?(slug.to_s)
  end
  
  def rank(limit = nil)
    rank_num = self.class.ranked.limit(limit).index(self)
    rank_num.nil? ? nil : rank_num + 1
  end
  
  def rank_this_month(limit = nil)
    rank_num = self.class.ranked_since(1.month.ago).limit(limit).index(self)
    rank_num.nil? ? nil : rank_num + 1
  end
  
end
