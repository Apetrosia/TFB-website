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

    avatar_image = fixture_file_upload(users(:bob).avatar, 'image/jpeg')

    bob.patch new_photo_user_path(bob.session[:user_id]), params: { user: { avatar: avatar_image } }

    bob.assert_redirected_to user_path(bob.session[:user_id])

    # проверка того, что у боба есть фото в базе
    assert_equal true, users(:bob).reload.avatar.attached?

    bob.follow_redirect!

    # проверка, что отображается то фото
    assert_select "img[src*='avatar.jpg']"

    assert_select "img[src*='#{users(:bob).avatar.filename}']"
  end

  test "change_password" do
    bob = log_in(user_tag: :bob, pass: "1234")
    bob.follow_redirect!

    bob.get user_path(bob.session[:user_id])

    bob.get email_verification_path

    assert_nil users(:bob).confirmation_token

    bob.post email_verification_path, params: { email: users(:bob).email }

    assert_not_nil users(:bob).reload.confirmation_token

    # проверка, что письмо отправлено
    assert_emails 1
    assert_equal [bob.email], mail.to
    assert_equal "Подтвердите пароль", mail.subject
    assert_match(/Подтвердите ваш пароль/, mail.body.encoded)

    bob.get registration_edit_path

    bob.post registration_new_password_path, params: { password: "123", confirmation: "123" }
    bob.follow_redirect!

    assert_equal 200, bob.status
    assert_equal user_path(bob.session[:user_id]), bob.path

  end



end
