class Project::ProfileController < Project::BaseController
  before_action :set_project, only: [:show, :edit, :update]

	def show
	end

  # renders edit view
  def edit
  end

  # updates data in db
  def update
    if @user.update_attributes(project_params)
      flash[:success] = "Información del proyecto actualizada"
      redirect_to project_profile_path
    else
      render "edit"
    end
  end

  private
    
    def set_project
      @project = current_project
      @user = @project.user
    end

    def project_params
      params.require(:user).permit(
        :id, :email, :password, :password_confirmation, :role, 
        project_attributes: [:id, :name, :field, :professor_id, :expertise_area_id, :client, :abstract, :video_url, :status])
    end
end
