class Professor::BaseController < ActionController::Base
	layout 'professor'

	before_action :require_user
	before_action :require_professor

	def require_user
		redirect_to login_professor_path unless current_user
	end

	def require_professor
		redirect_to login_professor_path unless current_user.professor?
	end
end