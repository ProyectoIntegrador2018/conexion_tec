class Student::ProjectsController < Student::BaseController
	before_action :set_project, only: [:new, :show, :edit, :update]

	def show
    end
    
    def index
        @projects = Project.where(student_id: current_user.userable_id)
    end

    def new
		@url = student_projects_path
	end

    def create
				# Como crear el proyecto con el current user id?? 
			if project_params["email_professor"].present? && project_params["name"].present? && project_params["description"].present? && project_params["abstract"].present?
				student = User.find_by(email: current_user["email"])
				professor = User.find_by(email: project_params["email_professor"])

				if professor.nil?
					prof_instance = Professor.create(department_id: project_params["department_professor"])
					professor = User.create(email: project_params["email_professor"],
																		userable_type: 'Professor',
																		userable_id: prof_instance.id,
																		name: project_params["name_professor"])
				end
				@project = Project.new(project_params.except(:email_professor,:name_professor, :department_professor))
				@project.student_id = current_user.userable_id
				@project.professor_id = professor.userable_id
				@project.edition_id = Edition.last.id
				@project.status_id = Status.first.id
				if @project.save
					flash[:success] = "Proyecto creado exitosamente!"
					redirect_to action: 'index'
				else
					flash[:error] = "Error al crear el proyecto"
					render 'new'
				end
			else
				flash[:danger] = "Por favor llene todos los campos."
				@url = student_projects_path
				set_project
				render 'new'
			end
    end

    def edit
		@url = student_project_path
    end
    
    def update
		if @project.update_attributes(project_params)
			flash[:success] = "Información del proyecto actualizada"
			redirect_to action: 'index'
		else
			flash[:error] = "Error"
			render "edit"
		end
	end


	private
        def set_project
            @project = params[:id].present? ? Project.find(params[:id]) : Project.new
		end

		def project_params
			params.require(:project).permit(
				:name,
				:field_id, 
				:client_id, 
				:category_id, 
				:expertise_area_id, 
				:abstract, 
				:video_url,
				:description,
				:email_professor,
				:name_professor,
				:department_professor)
		end

end
