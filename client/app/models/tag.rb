Tag::FUN_TAGS = %w{lazy boring dull apathetic bland nofriends uninspired loner}
Tag.class_eval do

  include TramlinesImages
  
  search_attributes %w{name}
  
  attr_accessible :description, :image, :color

  has_many :subscription_items, :class_name => "Subscription", :as => :attachable, :dependent => :destroy
  has_many :subscribers, :through => :subscription_items, :source => :member
  
  validates_format_of :color, :with => /#([0-9A-Fa-f]){6}/, :allow_blank => true, :message => "e.g. #FFFFFF"
  
    named_scope :for_members_with_badge, lambda {|badge_ref| {:joins => :taggings, :conditions => ["taggings.taggable_type = 'Member' AND taggings.taggable_id IN (?)", Member.with_badge(badge_ref).collect(&:id)], :group => "tags.id"}}
  
  class << self
    
    def color_hash(color)
      hexcolor = color.sub(/#/,"")
      arr = hexcolor.scan(/../).collect{|str| "%.2f" % (str.hex.to_f/255)}
      {:color_r => arr[0], :color_g => arr[1], :color_b => arr[2]}
    end
    
  end  
  
  def as_json(options = nil)
    {
      :id => id,
      :name => name.to_s,
      :session_ids => ConferenceSession.tagged_with(self).collect(&:id)
    }.merge(color_hash).as_json(options)
  end  
    
  def color_hash
    self.class::color_hash(color || "#CCCCCC")
  end
  
  def official?
    !description.blank?
  end


end
