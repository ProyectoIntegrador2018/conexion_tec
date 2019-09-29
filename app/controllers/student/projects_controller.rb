class Student::ProjectsController < Student::BaseController
	before_action :set_project, only: [:new, :show, :edit, :update]

	ITESM_MAIL = /^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(itesm|tec)\.mx$/

	def show
    end

    def index
        @projects = Project.where(student_id: current_user.userable_id)
        @projects = @projects.sort_by {|p| p.name}
    end

    def new
		@url = student_projects_path
	end

    def create
		if project_params["email_professor"].present?
			email_professor = project_params["email_professor"]
			professor = User.find_by(email: email_professor)

			if professor.nil?
				if email_professor.match(ITESM_MAIL)
					professor = create_professor(email_professor)
					project = create_project(professor)
					save_project(project)
				else
					flash.now[:danger] = "Favor de ingresar un correo de profesor del TEC"
					@url = student_projects_path
					set_project
					render 'new'
				end
			else
				project = create_project(professor)
				save_project(project)
			end
		else
			flash.now[:danger] = "Favor de ingresar el correo del profesor"
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

	def create_project(professor)
		project = Project.new(project_params.except(:email_professor,:name_professor, :department_professor))
		project.student_id = current_user.userable_id
		project.professor_id = professor.userable_id
		project.edition_id = Edition.last.id
		project.status_id = Status.first.id
		project
	end

	def create_professor(email_professor)
		password = SecureRandom.base64(10) # Generates random password
		prof_instance = Professor.create(department_id: project_params["department_professor"])
		professor = User.create(email: email_professor,
								userable_type: 'Professor',
								userable_id: prof_instance.id,
								name: project_params["name_professor"],
								password: password,
                                password_confirmation: password,
                                authorized: 1)
		professor
	end

	def save_project(project)
		if project.save
			UserMailer.with(user: current_user, project: project).project_confirmation.deliver_now
			flash[:success] = "¡Proyecto creado exitosamente!"
			redirect_to action: 'index'
		else
			flash.now[:danger] = "Error al crear el proyecto"
			@url = student_projects_path
			set_project
			render 'new'
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
        :semestrei,
				:department_professor)
		end

end
