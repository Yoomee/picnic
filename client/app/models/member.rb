Member.class_eval do

  WHAT_I_BRING_MAX_LENGTH = 100
  
  has_location  
  has_many :urls, :as => :attachable
  
  validates_length_of :what_i_bring, :maximum => WHAT_I_BRING_MAX_LENGTH, :on => :update, :allow_blank => true
  validates_presence_of :what_i_bring, :on => :update
  
  # validates_presence_of :country, :unless => Proc.new {|member| !member.new_record? || member.twitter_connected? || member.linked_in_connected? || member.facebook_connected?}
  
  def country
    location.country
  end
  
  def country=(val)
    location.country = val
  end
  
end