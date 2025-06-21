require "test_helper"

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get test_home_url
    assert_response :success
  end

  test "should get testing" do
    get test_testing_url
    assert_response :success
  end
end
