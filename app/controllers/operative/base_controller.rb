class Operative::BaseController < ActionController::Base
	layout 'operative'

	before_action :require_user
	before_action :require_operative
	before_action :require_authorization

	def require_user
		redirect_to login_operative_path unless current_user
	end

	def require_operative
		redirect_to login_operative_path unless current_user.operative?
	end

	def require_authorization
		if !current_user.authorized
			respond_to do |format|
				format.html { render 'common/not-authorized' }
			end
		end
	end
end