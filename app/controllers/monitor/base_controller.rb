class Monitor::BaseController < ActionController::Base
	layout 'monitor'

	# before_action :require_login
	before_action :require_monitor

	helper_method :current_monitor

	def current_monitor
		@current_monitor ||= current_user
	end

	def require_staff
		redirect_to login_monitor_path unless current_monitor.is_monitor?
	end
end
