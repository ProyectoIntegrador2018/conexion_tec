class Staff::AssignmentsController < Staff::BaseController

	def index
		@judges = Judge.all
	end

	def show
		@judge = Judge.find(params[:id])
		@projects = Project.where("status = 0")
											 .order(:num_assignments)
											 .order(:num_evaluations)
		@recommended_projects = Project.recommendations(@judge.expertise_area_ids)
	end

end
