class ProjectsController < ApplicationController
    # renders new view
  def new   
	  @user = User.new
	  @user.build_project
  end

  # insert data in db
  def create
	  @user = User.new(project_params)
    if @user.save
      flash[:success] = "Proyecto creado exitosamente!"
	  auto_login(@user)
	  redirect_to project_perfil_editar
    else
      render 'new'
    end
  end

  private
    def project_params
      params.require(:user).permit(
        :id, :email, :password, :password_confirmation, :role, 
        project_attributes: [:id, :name, :field, :professor_id, :kind, :client, :abstract, :video_url, :status])
    end
end
