require "test_helper"

class PersonalCabinetControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get personal_cabinet_index_url
    assert_response :success
  end
end
