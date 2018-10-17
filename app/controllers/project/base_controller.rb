class Project::BaseController < ActionController::Base
	layout 'project'

	before_action :require_login
	before_action :require_project

	helper_method :current_project

	def current_project
		@current_project ||= current_user.project
	end

	def require_project
		redirect_to login_project_path unless current_user.is_project?
	end
end