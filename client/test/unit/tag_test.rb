require File.dirname(__FILE__) + '/../../../test/test_helper'
class TagTest < ActiveSupport::TestCase
  
  should have_db_column(:description).of_type(:text)
  should have_db_column(:image_uid).of_type(:string)
  
end