class Admin::BaseController < ActionController::Base
	layout 'admin'

	before_action :require_login
	before_action :require_admin

	helper_method :current_admin

	def current_admin
		@current_admin ||= current_user.admin
	end

	def require_admin
		redirect_to login_admin_path unless current_user.is_admin?
	end
end