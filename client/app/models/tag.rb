Tag.class_eval do
  
  class << self
    
    def default_image(image_attr = 'image')
      Dragonfly::App[:images].fetch(default_image_location(image_attr))
    end
    
    def default_image_location(image_attr = 'image')
      "client_defaults/tag_image"
    end
    
  end
  
  def has_image?
    false
  end
  
  def image
    nil
  end
  
  def default_image(image_attr)
    self.class::default_image
  end
  
  
  
end