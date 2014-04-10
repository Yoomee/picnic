class Slideshow < ActiveRecord::Base
  
  belongs_to :attachable
  has_many :slideshow_items, :order => "position", :dependent => :destroy
  
  accepts_nested_attributes_for :slideshow_items, :allow_destroy => true
  
  def to_s
    "Slideshow #{id}"
  end
  
end