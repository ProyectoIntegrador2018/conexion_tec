class Common::BaseController < ActionController::Base
	layout 'common'

	before_action :require_login
	before_action :require_common

	def require_common # Change this
		redirect_to root_path unless current_user.admin? || current_user.committee? || current_user.operative?
	end
end