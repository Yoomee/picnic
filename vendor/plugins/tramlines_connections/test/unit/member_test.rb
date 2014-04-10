require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class MemberTest < ActiveSupport::TestCase
  
  should have_many(:friend_of_a_friends)

end
