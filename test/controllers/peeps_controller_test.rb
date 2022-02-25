require "test_helper"

class PeepsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get peeps_index_url
    assert_response :success
  end
end
