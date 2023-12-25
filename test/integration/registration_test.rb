require "test_helper"

require_relative '..\helpers\integration_helper'

class RegistrationTest < ActionDispatch::IntegrationTest

  include IntegrationHelper

  fixtures :users

  test "log_in" do

    # ввести правильные логин и пароль + войти
    bob = log_in(user_tag: :bob, pass: "1234")
    bob.follow_redirect!
    assert_equal 200, bob.status
    assert_equal root_path, bob.path

    tom = log_in(user_tag: :tom, pass: "12345")
    tom.follow_redirect!
    assert_equal 200, tom.status
    assert_equal root_path, tom.path

    # ввод неправильного логина
    darya = log_in(user_tag: :darya, login: "Dasha", pass: "00000")
    # проверка сообщения о непр. логине ...
    assert_equal 200, darya.status
    assert_equal auth_path, darya.path

    # ввод неправильного пароля
    bear = log_in(user_tag: :bear, pass: "1988")
    # проверка сообщения о непр. пароле ...
    assert_equal 200, bear.status
    assert_equal auth_path, bear.path
  end

  test "register" do

    # ввод корректных данных и успешная регистрация
    user1 = register("Vasya777", "vasya@example.com", "1234")
    user1.follow_redirect!
    assert_equal 200, user1.status
    assert_equal email_verification_path, user1.path
    # проверка, что почта автоматически вписалась в форму ...

    created_user = User.find_by(login: "Vasya777")
    assert_not_nil created_user

    confirm_email(user1, "Vasya777")
    # проверка, что письмо дошло ...
    user1.get user_path(created_user.id) # попадаем в личный кабинет
    assert_equal 200, user1.status
    # проверки на актуальность информации в личном кабинете ...

    # ввод некорректного (или существующего) логина
    user2 = register("Vasya777", "kdsf@example.com", "dsfk")
    # проверка сообщения о сущ. логине ...
    assert_equal 200, user2.status
    assert_equal registration_path, user2.path

    # некорректная (или существующая) почта
    user4 = register("Repeater", "vasya@example.com", "sdfgf")
    # проверка сообщения о сущ. почте ...
    assert_equal 200, user4.status
    assert_equal registration_path, user4.path

    user5 = register("fjgjdf", "not_email", "dsfdsg")
    # проверка сообщения о некорректной почте ...
    assert_equal 200, user5.status
    assert_equal registration_path, user5.path

    # слабый пароль ?

  end

  private
  module RegistrationAssertions

  end

  def register(login, email, pass, confirmation = pass)
    open_session do |sess|
      sess.extend(RegistrationAssertions)
      sess.get registration_path
      assert_equal 200, sess.status
      sess.post registration_path,
                params: { user: { login: login,
                                  email: email,
                                  password: pass,
                                  password_confirmation: confirmation }}
    end
  end

  def confirm_email(sess, email)
    sess.post email_verification_path, params: { email: email }
  end

end

