class Common::ProjectsController < Common::AdminCommitteeBaseController
	before_action :set_project, only: [:new, :show, :edit, :update, :destroy, :approve, :reject]

	ITESM_MAIL = /^[a-zA-Z0-9_.+-]+@(?:(?:[a-zA-Z0-9-]+\.)?[a-zA-Z]+\.)?(itesm|tec)\.mx$/

	def show
	end

	def index
    @projects = Project.all.sort_by {|p| p.name}
	end

	def new
		@url = common_projects_path
	end

	def create
		password = SecureRandom.base64(10) # Generates random password
		student_email = project_params["student_id"]
		professor_email = project_params["professor_id"]

		if student_email.present? && professor_email.present?
			student = User.find_by(email: student_email)
			professor = User.find_by(email: professor_email)

			if professor.nil? # We need to create a professor
				if professor_email.match(ITESM_MAIL)
					professor = create_professor(password, professor_email)
				end
			end

			if student.nil? # We need to create a student
				if student_email.match(ITESM_MAIL)
					student = create_student(password, student_email)
				end
			end

			if !professor.nil? && !student.nil?
				project = create_project(professor, student)

				if project.save
					flash[:success] = "¡Proyecto creado exitosamente!"
					redirect_to action: 'index'
				else
					flash[:danger] = "Error al crear el proyecto"
					@url = common_projects_path
					set_project
					render 'new'
				end
			else
				flash[:danger] = "Por favor asegurese de utilizar correos del TEC."
				@url = common_projects_path
				set_project
				render 'new'
			end
		else
			flash[:danger] = "Por favor complete los campos relacionados a estudiante y profesor."
			@url = common_projects_path
			set_project
			render 'new'
		end
	end

	def edit
		@url = common_project_path
	end

	def update
		if @project.update_attributes(project_params)
			flash[:success] = "Información del proyecto actualizada"
			redirect_to action: 'index'
		else
			flash.now[:danger] = "Error"
			render "edit"
		end
	end

	def destroy
		@project.delete
		flash[:success] = "Proyecto eliminado"
		redirect_to common_projects_path
	end

	def approve
		@project.status_id = Status.last.id
		if @project.save
			flash[:success] = "Proyecto aprobado"
			redirect_to common_projects_path
		else
			flash[:danger] = "Error al aprobar proyecto"
			redirect_to common_projects_path
		end
	end

	def reject
		@project.status_id = Status.third.id
		if @project.save
			flash[:success] = "Proyecto rechazado"
			redirect_to common_projects_path
		else
			flash[:danger] = "Error al rechazar proyecto"
			redirect_to common_projects_path
		end
	end

	def create_project(professor, student)
		project = Project.new(project_params.except(:student_id, :professor_id,:name_student,:name_professor))
		project.student_id = student.userable_id
		project.professor_id = professor.userable_id
		project.edition_id = Edition.last.id
		project.status_id = Status.first.id
		project
	end

	def create_student(password, mail)
		stud_instance = Student.create(major_id: Major.first.id)
		student = User.create(email: mail,
							  userable_type: 'Student',
							  userable_id: stud_instance.id,
							  name: project_params["name_student"],
							  password: password,
	                          password_confirmation: password,
	                          authorized: 1)
		student
	end

	def create_professor(password, mail)
		prof_instance = Professor.create(department_id: Department.first.id)
		professor = User.create(email: mail,
								userable_type: 'Professor',
								userable_id: prof_instance.id,
								name: project_params["name_professor"],
								password: password,
	                            password_confirmation: password,
	                            authorized: 1)
		professor
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
				:name_student,
				:professor_id,
				:name_professor,
        :social_impact,
				:stand_id)
		end

end
