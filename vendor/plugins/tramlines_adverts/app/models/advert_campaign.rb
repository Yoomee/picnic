class AdvertCampaign < ActiveRecord::Base
  
  has_many :adverts, :dependent => :destroy, :foreign_key => "campaign_id"
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
end