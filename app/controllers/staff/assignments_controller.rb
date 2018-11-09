class Staff::AssignmentsController < Staff::BaseController

	def index
		@judges = Judge.all
	end

	def show
		@evaluation = Evaluation.new
		@judge = Judge.find(params[:id])
		@evaluation.judge = @judge
		@recommended_projects = Project.recommendations(@judge.expertise_area_ids)
		@projects = Project.not_qualified.order_projects
		@projects = @projects - @recommended_projects
	end

	def create

	end

	def update
		project_ids = params[:judge][:project_ids]
		puts project_ids
	end

	private 
		def judge_params
	      params.require(:judge).permit(
	        project_ids: [])
	    end
end
