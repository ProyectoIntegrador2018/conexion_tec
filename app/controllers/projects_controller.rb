class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  # renders new view
  def new   
    @project = Project.new 
  end

  # insert data in db
  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:success] = "Proyecto creado exitosamente!"
      redirect_to @project
    else
      render 'new'
    end
  end

  # renders edit view
  def edit
  end

  # updates data in db
  def update
    if @project.update_attributes(project_params)
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
    end

    def project_params
      params.require(:project).permit(:name, :email, :password, :password_confirmation)
    end
end
