require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get sign_out" do
    get :sign_out
    assert_response :success
  end

end
