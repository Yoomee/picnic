class PointsTransfer < ActiveRecord::Base
  
  belongs_to :member
  belongs_to :points_event
  belongs_to :attachable, :polymorphic => true
  
  validates_presence_of :member, :points, :points_event

  before_validation_on_create :set_points
  after_create :trigger_badge
  
  named_scope :non_admins, :joins => :member, :conditions => ["members.is_admin = 0"]
  named_scope :with_event_slug, lambda {|name| {:joins => :points_event, :conditions => ["points_events.slug = ?", name.to_s]}}
  
  def points_string
    points >= 0 ? "+#{points}" : "#{points}"
  end
  
  def points_event_name
    points_event.try(:name)
  end
  
  private
  def set_points
    self.points ||= points_event.try(:points)
  end
  
  def trigger_badge
    member.handle_badge_trigger(:actions)
  end
  
end