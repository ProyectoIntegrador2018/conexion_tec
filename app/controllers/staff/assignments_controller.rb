class Staff::AssignmentsController < Staff::BaseController

	def index
		@judges = Judge.all
	end

	def show
		@judge = Judge.find(params[:id])
		@projects = Project.where("status = 3")
											 .order(:num_assignments)
											 .order(:num_evaluations)
		@recommended_projects = @projects.limit(5)
	end

end
