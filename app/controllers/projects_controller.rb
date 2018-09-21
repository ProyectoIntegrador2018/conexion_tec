class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def show
    @project = Project.find(params[:id])
  end

  def index
    if params[:message].nil?
      redirect_to root_url
    else
      @user_role = ApplicationHelper.decrypt(params[:message])
      if (@user_role != "admin")
        redirect_to root_url
      end
      session[:message] = @user_role
      @projects = Project.all
    end
  end

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
	  redirect_to @user.project
    else
      render 'new'
    end
  end

  # renders edit view
  def edit
    @user = @project.user
  end

  # updates data in db
  def update
    
    if @project.update_attributes(project_params[:project_attributes]) && @user.save
      flash[:success] = "Información del proyecto actualizada"
      redirect_to @project
    else
      render "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_url
  end

  private
    def set_project
      @project = Project.find(params[:id])
      @user = @project.user
    end

    def project_params
      params.require(:user).permit(:id, :email, :password, :password_confirmation, :role, project_attributes: [:id, :name, :field, :kind, :client, :abstract, :video_url, :status])
    end
end
