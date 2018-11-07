class Staff::AssignmentsController < Staff::BaseController

	def index
		@judges = Judge.all
	end

	def show
		@judge = Judge.find(params[:id])
		@projects = Project.not_qualified.order_projects
		@recommended_projects = Project.recommendations(@judge.expertise_area_ids)
	end

end
