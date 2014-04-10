require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class SlideshowTest < ActiveSupport::TestCase
  
  should have_db_column(:attachable_type).of_type(:string)
  should have_db_column(:attachable_id).of_type(:integer)  
  should have_db_column(:active).of_type(:boolean)
  should have_timestamps
  
  should belong_to(:attachable)
  should have_many(:slideshow_items)
  
end