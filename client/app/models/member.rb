Member.class_eval do
  
  has_location
  
  validates_presence_of :country
  
  def country
    location.country
  end
  
  def country=(val)
    location.country = val
  end
  
end