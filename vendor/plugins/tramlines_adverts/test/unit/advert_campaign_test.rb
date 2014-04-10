require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class AdvertCampaignTest < ActiveSupport::TestCase

  subject {Factory.create(:advert_campaign)}

  should have_db_column(:name)

  should have_many(:adverts)
  
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)
  
end

