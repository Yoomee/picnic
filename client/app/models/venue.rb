class Venue < ActiveRecord::Base
  
  has_many :events, :dependent => :destroy
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
end
