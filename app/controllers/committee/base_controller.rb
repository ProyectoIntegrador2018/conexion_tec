class Committee::BaseController < ActionController::Base
	layout 'committe'

	before_action :require_login
	before_action :require_committee

	helper_method :current_committee

	def current_committee
		@current_committee ||= current_user
	end

	def require_committee
		redirect_to login_admin_path unless current_user.admin?
	end
end