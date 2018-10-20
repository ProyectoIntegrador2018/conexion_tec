class Monitor::EvaluationController < Monitor::BaseController
	def index
		@projects = Project.all
	end

	def edit
		project = params[:id]
	end

	def update
		project = Project.find(params[:project][:id])

		if project.update_attributes(project_params)
			flash[:success] = "Assistencia marcada"
		else
			flash[:failure] = "Assistencia no marcada"
			redirect_to monitor_projects_path
			puts project.errors.full_messages	
			puts '******************************'
		end
	end

	private
		def project_params
			params.require(:project).permit(:id, :assistance)
		end
end
