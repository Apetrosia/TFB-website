require "test_helper"
require_relative '..\helpers\integration_helper'

class PersonalCabinetUsageTest < ActionDispatch::IntegrationTest
  fixtures :users

  include IntegrationHelper

  test "switch_photo" do

    bob = log_in(user_tag: :bob, pass: "1234")
    bob.follow_redirect!
    assert_equal 200, status
    assert_equal root_path, bob.path

  end

end
