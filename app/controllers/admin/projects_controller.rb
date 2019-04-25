class Admin::ProjectsController < Admin::BaseController
	before_action :set_project, only: [:new, :show, :edit, :update, :destroy, :approve, :reject]

	def show
	end

	def index
		@projects = Project.all

	end

	def new
		@url = admin_projects_path
	end

	def create
		if project_params["professor_id"].nil? || project_params["student_id"].nil?
			flash[:success] = "Favor de ingresar la información correspondiente en todos los campos."
			render 'new'
		end
	

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
		@url = admin_project_path
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

	def destroy
		@project.delete
		flash[:success] = "Proyecto eliminado"
		redirect_to admin_projects_path
	end

	def approve
		@project.status_id = 4
		if @project.save
			flash[:success] = "Proyecto aprobado"
			redirect_to admin_projects_path
		else
			flash[:error] = "Error al aprobar proyecto"
			redirect_to admin_projects_path
		end
	end

	def reject
		@project.status_id = 3
		if @project.save
			flash[:success] = "Proyecto rechazado"
			redirect_to admin_projects_path
		else
			flash[:error] = "Error al rechazar proyecto"
			redirect_to admin_projects_path
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
