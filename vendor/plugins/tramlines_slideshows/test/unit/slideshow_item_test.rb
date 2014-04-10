require File.dirname(__FILE__) + '/../../../../../test/test_helper'
class SlideshowItemTest < ActiveSupport::TestCase
  
  should have_db_column(:slideshow_id).of_type(:integer)
  should have_db_column(:text).of_type(:text)
  should have_db_column(:photo_id).of_type(:integer)
  should have_db_column(:position).of_type(:integer)
  should have_timestamps
  
  should belong_to(:slideshow)
  should belong_to(:photo)
  
end