class Staff::AssignmentsController < Staff::BaseController

	def index
		@judges = Judge.all
	end

	def show
		@judge = Judge.find(params[:id])
		@recommended_projects = Project.recommendations(@judge.expertise_area_ids)
		@projects = Project.not_qualified.order_projects
		@projects = @projects - @recommended_projects
	end

end
