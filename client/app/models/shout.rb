Shout.class_eval do
  
  has_location
  
  class << self
    
    def default_image(image_attr = 'image')
      Dragonfly::App[:images].fetch(default_image_location(image_attr))
    end
    
    def default_image_location(image_attr = 'image')
      "client_defaults/shout_image"
    end
    
  end
  
  def has_image?
    attachable.try(:has_image?)
  end
  
  def image
    attachable.try(:image)
  end
  
  def default_image(image_attr)
    self.class::default_image
  end
  
  def related_shouts
    Shout.random.limit(3)
  end
  
  def to_s
    title || ''
  end
  
end