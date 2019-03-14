class Student::BaseController < ActionController::Base
	layout 'student'

	before_action :require_user
	before_action :require_student

	def require_user
		redirect_to login_student_path unless current_user
	end

	def require_student
		redirect_to login_student_path unless current_user.student?
	end
end