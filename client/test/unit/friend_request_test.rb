require File.dirname(__FILE__) + '/../../../test/test_helper'
class FriendRequestTest < ActiveSupport::TestCase
  
  should belong_to(:from_member)
  
end