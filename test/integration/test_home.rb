require "test_helper"
class HomeTests < ActionDispatch::IntegrationTest

  def test_goto_forum

    get "/forum"

    assert_response :success

  end

end