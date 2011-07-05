require File.dirname(__FILE__) + '/../../../test/test_helper'
class MemberTest < ActiveSupport::TestCase
  
  should have_many(:subscriptions).dependent(:destroy)
  should have_many(:subscription_items).dependent(:destroy)  
  should have_many(:subscribers).through(:subscription_items)
  
end