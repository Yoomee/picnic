require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class MemberTest < ActiveSupport::TestCase
  
  should have_db_column(:banned_at).of_type(:datetime)
  should have_db_column(:banned_by_id).of_type(:integer)
  should have_db_column(:banned_message).of_type(:text)
  
  should belong_to(:banned_by)
  
end