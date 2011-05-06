Shout.class_eval do

  include TramlinesImages
  
  has_location
  
  def has_image?
    attachable.try(:has_image?)
  end
  
  def image
    attachable.try(:image)
  end
  
  def related_shouts
    Shout.random.limit(3)
  end
  
  def to_s
    title || ""
  end
  
end