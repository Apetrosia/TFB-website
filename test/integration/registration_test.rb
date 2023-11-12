require "test_helper"

class RegistrationTest < ActionDispatch::IntegrationTest
  fixtures :users

  test "log_in" do
    get auth_path
    assert_equal 200, status

    # ввести логин и пароль | войти
    post auth_path, params: { email: users(:bob).email, password_confirmation: users(:bob).password }
    follow_redirect!

    assert_equal 200, status
    assert_equal root_path, path
  end

end

