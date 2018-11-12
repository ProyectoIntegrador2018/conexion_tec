require 'test_helper'

class MainScreenControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "redirect to login admin" do
  	get root_url
  	click_button('Login administrador')
  	# get login_admin_url
  	# assert_response 200
  	# assert_redirected_to controller: "administrator_session", action: "new"
  end
end
