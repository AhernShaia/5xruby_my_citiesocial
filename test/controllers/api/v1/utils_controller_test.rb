require 'test_helper'

class Api::V1::UtilsControllerTest < ActionDispatch::IntegrationTest
  test "should get subscribe" do
    get api_v1_utils_subscribe_url
    assert_response :success
  end

end
