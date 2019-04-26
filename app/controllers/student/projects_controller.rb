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
    	professor_email = project_params["email_professor"]
		professor = User.find_by(email: professor_email)

		if professor.nil?
			department_id = project_params["department_professor"]
			professor_name = project_params["name_professor"]
			password = SecureRandom.base64(10) # Generates random password

			prof_instance = Professor.create(department_id: department_id)
			professor = User.create(email: professor_email,
                                userable_type: 'Professor',
                                userable_id: prof_instance.id,
                                name: professor_name,
                                password: password,
                                password_confirmation: password)
			byebug
        end
        
        @project = Project.new(project_params.except(:email_professor, :department_professor, :name_professor))
        @project.student_id = current_user.userable_id
		@project.professor_id = professor.userable_id
		@project.edition_id = Edition.last.id
		@project.status_id = Status.first.id

		if @project.save
			UserMailer.with(user: current_user, project: @project).project_confirmation.deliver_now
			flash[:success] = "Proyecto creado exitosamente!"
			redirect_to action: 'index'
		else
			flash[:error] = "Error al crear el proyecto"
			@url = student_project_path
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
