require "test_helper"

class Api::RestrictedControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_restricted_index_url
    assert_response :success
  end
end
