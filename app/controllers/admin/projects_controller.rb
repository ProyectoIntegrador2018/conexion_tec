class Admin::ProjectsController < Admin::BaseController
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def show
		@project = Project.find(params[:id])
	end

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
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
	end

	# TODO: Arreglar; error al actualizar datos del proyecto
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
			@project = Project.find(params[:id])
		end

		def project_params
			params.require(:project).permit(
				:id, :name, :field_id, :client_id, :category_id, :expertise_area_id, :abstract, :video_url,
				:description, :status_id, :selection_score)
		end

end
