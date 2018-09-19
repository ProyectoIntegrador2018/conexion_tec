require 'test_helper'

class AdministratorSessionControllerTest < ActionDispatch::IntegrationTest
	test "should get create" do
		get login_admin_path
		assert_response :success
	end
end
