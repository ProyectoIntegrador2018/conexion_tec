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
        student = User.find_by(email: project_params["student_id"])
		professor = User.find_by(email: project_params["professor_id"])

		if professor.nil?
			prof_instance = Professor.create(department_id: 4)
			professor = User.create(email: project_params["professor_id"],
                                userable_type: 'Professor',
                                userable_id: prof_instance.id)
        end
        
        @project = Project.new(project_params.except(:student_id, :professor_id))
        @project.student_id = student.userable_id
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
                :selection_score,
                :student_id,
				:professor_id)
		end

end
