class Project::ProfileController < Project::BaseController

	def show
		@project = current_project
		@user = @project.user
	end

  # renders edit view
  def edit
  end

  # updates data in db
  def update
    if @user.update_attributes(project_params)
      flash[:success] = "Información del proyecto actualizada"
      redirect_to @project
    else
      render "edit"
    end
  end

  private
    
    def project_params
      params.require(:user).permit(
        :id, :email, :password, :password_confirmation, :role, 
        project_attributes: [:id, :name, :field, :professor_id, :kind, :client, :abstract, :video_url, :status])
    end
end
