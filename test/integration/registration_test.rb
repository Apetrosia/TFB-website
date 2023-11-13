require "test_helper"

class RegistrationTest < ActionDispatch::IntegrationTest
  fixtures :users

  test "log_in" do
    get auth_path
    assert_equal 200, status

    # ввести правильные логин и пароль | войти
    bob = log_in(user_tag: :bob, pass: "1234")
    bob.follow_redirect!
    assert_equal 200, status
    assert_equal root_path, bob.path

    tom = log_in(user_tag: :tom, pass: "12345")
    tom.follow_redirect!
    assert_equal 200, status
    assert_equal root_path, tom.path

    # ввод неправильного логина
    darya = log_in(user_tag: :darya, login: "Dasha", pass: "00000")
    # проверка сообщения о непр. логине ...
    assert_equal 200, status
    assert_equal auth_path, darya.path

    # ввод неправильного пароля
    bear = log_in(user_tag: :bear, pass: "1988")
    # проверка сообщения о непр. пароле ...
    assert_equal 200, status
    assert_equal auth_path, bear.path

  end

  private
  module RegistrationAssertions

  end

  def log_in(user_tag:, login: users(user_tag).login, pass:)
    open_session do |sess|
      sess.extend(RegistrationAssertions)
      sess.post auth_path, params: { user: { login: login,
                                             password: pass } }
    end
  end

end

