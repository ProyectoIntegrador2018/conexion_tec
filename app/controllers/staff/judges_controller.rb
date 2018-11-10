class Staff::JudgesController < Staff::BaseController

	def index
		@judges = Judge.with_no_projects
	end

	def show
		@evaluation = Evaluation.new
		@judge = Judge.find(params[:id])
		@user = @judge.user
		@evaluation.judge = @judge
		@recommended_projects = Project.recommendations(@judge.expertise_area_ids)
		@projects = Project.not_qualified.order_projects
		@projects = @projects - @recommended_projects
	end

	def create
	end

	def update
		puts "PARAMETROS"
		puts params.inspect
		@judge = Judge.find(params[:id])
		if @judge.update_attributes(judge_params)
			flash[:success] = "Proyectos asignados satifactoriamente!"
			redirect_to staff_judges_path
		else
			flash[:error] = "No se pudo asignar los proyectos al juez"
			redirect_to staff_judge_path(@judge.id)
		end
	end

	private 
		def judge_params
	      params.require(:judge).permit(
	      	:id, 
	        project_ids: [])
	    end
end
