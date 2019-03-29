class Admin::ProjectsController < Admin::BaseController
	before_action :set_project, only: [:new, :show, :edit, :update, :destroy]

	def show
	end

	def index
		@projects = Project.all

	end

	def new
		@url = admin_projects_path
	end

	def create
		@project = Project.new(project_params)
		if @project.save
			flash[:success] = "Proyecto creado exitosamente!"
		else
			render 'new'
		end
	end

	def edit
		@url = admin_project_path
	end

	def update
		if @project.update_attributes(project_params)
			flash[:success] = "Información del proyecto actualizada"
			redirect_to edit_admin_project_path(@project)
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
				:name, :field_id, :client_id, :category_id, :expertise_area_id, :abstract, :video_url,
				:description, :status_id, :selection_score)
		end

end
