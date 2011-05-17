Member.class_eval do
  
  has_location  
  has_many :urls, :as => :attachable
  
  validates_presence_of :country, :unless => Proc.new {|member| member.twitter_connected? || member.linked_in_connected?}
  validates_presence_of :what_i_bring
  
  def country
    location.country
  end
  
  def country=(val)
    location.country = val
  end
  
end