require "test_helper"

class TransitControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get transit_home_url
    assert_response :success
  end
end
