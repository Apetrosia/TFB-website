require "test_helper"
require_relative '..\helpers\integration_helper'

class PersonalCabinetUsageTest < ActionDispatch::IntegrationTest
  fixtures :users

  include IntegrationHelper

  test "switch_photo" do

    bob = log_in(user_tag: :bob, pass: "1234")
    bob.follow_redirect!
    assert_equal 200, bob.status
    assert_equal users_path, bob.path

    bob.patch "/users/#{session[:user_id]}/new_photo", params: {  }
    # проверка того, что у боба правильное фото в базе ...
    # проверка, что отображается то фото ...

  end



end
