require File.dirname(__FILE__) + '/../../../test/test_helper'
class SubscriptionTest < ActiveSupport::TestCase
  
  should have_db_column(:member_id).of_type(:integer)
  should have_db_column(:attachable_type).of_type(:string)
  should have_db_column(:attachable_id).of_type(:integer)
  should have_timestamps

  should belong_to(:member)  
  should belong_to(:attachable)
  
end