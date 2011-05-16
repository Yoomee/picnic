Member.class_eval do
  
  has_location  
  has_many :urls, :as => :attachable
  
end