class Admin::ProjectsController < Admin::BaseController
	before_action :set_project, only: [:show, :edit, :update, :destroy]

	def show
		@project = Project.find(params[:id])
	end

	def index
		@projects = Project.all
	end

	def new
		@user = User.new
		@user.build_project
	end

	def create
		@user = User.new(project_params)
		if @user.save
			flash[:success] = "Proyecto creado exitosamente!"
		auto_login(@user)
		redirect_to @user.project
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @user.update_attributes(project_params)
			flash[:success] = "Información del proyecto actualizada"
			redirect_to edit_admin_project_path(@project)
		else
			render "edit"
		end
	end

	private
		def set_project
			@project = Project.find(params[:id])
			@user = @project.user
		end

		def project_params
			params.require(:user).permit(
				:id, :email, :password, :password_confirmation, :role, 
				project_attributes: [:id, :name, :field, :professor_id, :expertise_area_id, :client, :abstract, :video_url, :status, :score, :reason, :event_date_id, :stand])
		end

end
