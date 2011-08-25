Tag::FUN_TAGS = %w{lazy boring dull apathetic bland nofriends uninspired loner}
Tag.class_eval do

  include TramlinesImages
  
  search_attributes %w{name}
  
  attr_accessible :description, :image, :color

  has_many :subscription_items, :class_name => "Subscription", :as => :attachable, :dependent => :destroy
  has_many :subscribers, :through => :subscription_items, :source => :member
  
  validates_format_of :color, :with => /#([0-9A-Fa-f]){6}/, :allow_blank => true, :message => "e.g. #FFFFFF"
  
    named_scope :for_members_with_badge, lambda {|badge_ref| {:joins => :taggings, :conditions => ["taggings.taggable_type = 'Member' AND taggings.taggable_id IN (?)", Member.with_badge(badge_ref).collect(&:id)], :group => "tags.id"}}
  
  def official?
    !description.blank?
  end


end
