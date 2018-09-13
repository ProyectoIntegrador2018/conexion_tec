class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def new   
    @project = Project.new 
  end

  def create
      @project = Project.new(project_params)
      if @project.save
        flash[:success] = "Usuario creado exitosamente!"
        redirect_to @project
      else
          render 'new'
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name, :email, :password, :password_confirmation)
    end
end
