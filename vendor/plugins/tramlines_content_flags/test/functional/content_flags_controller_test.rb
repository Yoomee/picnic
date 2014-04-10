require File.dirname(__FILE__) + '/../../../../../test/test_helper'

class ContentFlagsControllerTest < ActionController::TestCase

  should have_action(:new).with_level(:open)
  should have_action(:create).with_level(:open)

end
