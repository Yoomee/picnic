class Badge < ActiveRecord::Base
  
  include TramlinesImages
  
  has_many :badge_awardings, :dependent => :destroy
  has_many :members, :through => :badge_awardings
  validates_presence_of :ref, :name, :description
  validates_presence_of :image, :unless => Proc.new {|badge| badge.seeded?}
  validates_uniqueness_of :ref, :name, :allow_blank => true
  validates_presence_of :trigger_name, :trigger_num, :if => :has_trigger?
  validates_numericality_of :trigger_num, :greater_than_or_equal_to => 0, :allow_nil => true
  
  before_validation_on_create :set_ref
  before_save :remove_trigger
  
  attr_boolean_accessor :seeded, :has_trigger
  
  named_scope :for_trigger, lambda {|trigger, num| {:conditions => ["badges.trigger_name = ? AND badges.trigger_num <= ?", trigger, num]}}
  
  class << self
    
    def handle_all_triggers!
      Member.all.each(&:handle_all_badge_triggers)
    end
    
  end
  
  def has_trigger
    return Module::value_to_boolean(@has_trigger) if !@has_trigger.nil?
    !trigger_name.blank? && !trigger_num.blank?
  end
  alias_method :has_trigger?, :has_trigger
  
  private
  def remove_trigger
    self.trigger_name, self.trigger_num = [nil, nil] if !has_trigger?
  end
  
  def set_ref
    self.ref = name.downcase.fully_underscore if !name.blank?
  end
  
end