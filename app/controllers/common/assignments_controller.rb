class Common::AssignmentsController < Common::BaseController

	def index
		@projects = Project.all
	end
end