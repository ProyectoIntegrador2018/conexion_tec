class Judge::BaseController < ActionController::Base
	layout 'judge'

	before_action :require_login
	before_action :require_judge
	before_action :require_authorization

	# helper_method :current_judge

	# def current_judge
	# 	@current_judge ||= current_user.judge
	# end

	def require_user
		redirect_to login_judge_path unless current_user
	end

	def require_judge
		redirect_to login_judge_path unless current_user.judge?
	end

	def require_authorization
		if !current_user.authorized
			respond_to do |format|
				format.html { render 'common/not-authorized' }
			end
		end
	end

end