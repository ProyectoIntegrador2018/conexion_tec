class Operative::BaseController < ActionController::Base
	layout 'operative'

	before_action :require_user
	before_action :require_operative

	def require_user
		redirect_to login_operative_path unless current_user
	end

	def require_operative
		redirect_to login_operative_path unless current_user.operative?
	end
end