Shout.class_eval do
  
  class << self
    
    def default_image
      Dragonfly::App[:images].fetch('client_defaults/shout_image')
    end
    
  end
  
  def default_image(dummy_arg = nil)
    attachable.try(:default_image) || self.class::default_image
  end
  
end