class Staff::BaseController < ActionController::Base
	layout 'staff'

	before_action :require_login
	before_action :require_staff

	helper_method :current_staff

	def current_staff
		@current_staff ||= current_user
	end

	def require_staff
		redirect_to login_staff_path unless current_user.is_staff?
	end
end