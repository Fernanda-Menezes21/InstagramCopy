require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get string:user_name" do
    get user_string:user_name_url
    assert_response :success
  end

  test "should get string:real_name" do
    get user_string:real_name_url
    assert_response :success
  end

  test "should get string:password" do
    get user_string:password_url
    assert_response :success
  end
end
