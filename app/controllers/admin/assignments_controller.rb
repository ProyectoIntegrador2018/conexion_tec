class Admin::AssignmentsController < Admin::BaseController

	def index
		@projects = Project.all
	end
end