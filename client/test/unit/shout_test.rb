require File.dirname(__FILE__) + '/../../../test/test_helper'
class ShoutTest < ActiveSupport::TestCase
  
  should have_db_column(:title).of_type(:string)
  
end