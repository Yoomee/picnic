require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class ReferralTest < ActiveSupport::TestCase
  
  should belong_to(:member)
  should have_db_column(:code)
  
end