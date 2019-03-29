class Judge::BaseController < ActionController::Base
	layout 'judge'

	before_action :require_login
	before_action :require_judge

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

end