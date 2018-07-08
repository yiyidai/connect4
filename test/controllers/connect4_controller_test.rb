require 'test_helper'

class Connect4ControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get connect4_home_url
    assert_response :success
  end

end
