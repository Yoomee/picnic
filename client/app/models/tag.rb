Tag::FUN_TAGS = %w{lazy boring dull apathetic bland nofriends uninspired loner}
Tag.class_eval do

  include TramlinesImages
  
  search_attributes %w{name}
  
  attr_accessible :description, :image, :color

  has_many :subscription_items, :class_name => "Subscription", :as => :attachable, :dependent => :destroy
  has_many :subscribers, :through => :subscription_items, :source => :member
  
  validates_format_of :color, :with => /#([0-9A-Fa-f]){6}/, :allow_blank => true, :message => "e.g. #FFFFFF"
  
  def official?
    !description.blank?
  end
    

end
