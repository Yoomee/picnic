require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class PointsTransferTest < ActiveSupport::TestCase
  
  should have_db_column(:member_id).of_type(:integer)
  should have_db_column(:points_event_id).of_type(:integer)
  should have_db_column(:points).of_type(:integer)
  
  should belong_to(:member)
  should belong_to(:points_event)
  
  should validate_presence_of(:member)
  should validate_presence_of(:points)
  should validate_presence_of(:points_event)
  
end
