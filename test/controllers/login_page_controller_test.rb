require 'test_helper'

class LoginPageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get login_page_home_url
    assert_response :success
  end

end
