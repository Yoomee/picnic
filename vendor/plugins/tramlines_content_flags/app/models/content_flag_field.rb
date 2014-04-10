class ContentFlagField < ActiveRecord::Base

  belongs_to :content_flag
  
  validates_presence_of :name
  
  def name=(val)
    val = val.to_s if val.is_a?(Symbol)
    write_attribute(:name, val)
  end
  
end