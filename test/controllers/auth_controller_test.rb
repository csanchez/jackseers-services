require 'test_helper'

class AuthControllerTest < ActionController::TestCase
  test "should get authenticate" do
    get :authenticate
    assert_response :success
  end

end
