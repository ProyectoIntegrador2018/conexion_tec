class Project::ProfileController < Project::BaseController

	def show
		@project = current_project
	end
end
