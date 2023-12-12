require "test_helper"
require_relative '..\helpers\integration_helper'

class PersonalCabinetUsageTest < ActionDispatch::IntegrationTest
  fixtures :users

  include IntegrationHelper

  test "switch_photo" do

    bob = log_in(user_tag: :bob, pass: "1234")
    bob.follow_redirect!
    assert_equal 200, bob.status
    # assert_equal users_path, bob.path

    bob.get user_path(bob.session[:user_id])

    bob.patch new_photo_user_path(bob.session[:user_id]), params: {  }
    # проверка того, что у боба правильное фото в базе ...
    # проверка, что отображается то фото ...
  end

  test "change_password" do
    bob = log_in(user_tag: :bob, pass: "1234")
    bob.follow_redirect!

    bob.get user_path(bob.session[:user_id])

    bob.get email_verification_path

    bob.post email_verification_path, params: { email: users(:bob).email }
    # проверка, что пришло письмо ...

    bob.get registration_edit_path

    bob.post registration_new_password_path, params: { password: "123", confirmation: "123" }
    bob.follow_redirect!

    assert_equal 200, bob.status
    assert_equal user_path(bob.session[:user_id]), bob.path

  end



end
