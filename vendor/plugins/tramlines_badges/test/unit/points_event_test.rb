require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class PointsEventTest < ActiveSupport::TestCase
  
  should have_db_column(:slug).of_type(:string)
  should have_db_column(:name).of_type(:string)
  should have_db_column(:points).of_type(:integer)
  
  should validate_presence_of(:slug)
  should validate_presence_of(:name)
  should validate_presence_of(:points)

  should have_many(:points_transfers)
  
end
