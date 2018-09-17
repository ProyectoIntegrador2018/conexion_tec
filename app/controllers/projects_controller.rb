class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def show
    @project = Project.find(params[:id])
  end

  def new   
    @project = Project.new 
  end

  def create
      @project = Project.new(project_params)
      debugger
      if @project.save
        flash[:success] = "Proyecto creado exitosamente!"
        redirect_to @project
      else
          render 'new'
      end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :email, :password, :password_confirmation)
    end
end
