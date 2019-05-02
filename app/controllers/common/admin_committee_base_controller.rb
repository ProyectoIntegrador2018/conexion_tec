 class Common::AdminCommitteeBaseController < ActionController::Base
	layout 'common'

	before_action :require_login
	before_action :require_common
	before_action :require_authorization

	def require_common # Change this
		redirect_to root_path unless current_user.admin? || current_user.committee?
	end

	def require_authorization
		if !current_user.authorized
			respond_to do |format|
				format.html { render 'common/not-authorized' }
			end
		end
	end
end