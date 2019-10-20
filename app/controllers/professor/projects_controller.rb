class Professor::ProjectsController < Professor::BaseController
  before_action :set_project, only: [:show]
  
  def show
  end
      
  def index
    @projects = Project.where(professor_id: current_user.userable_id)
  end

  def approve
    project = Project.find(params[:id])
    project.status_id = Status.first.id
    project_save(project)
  end

  def reject
    project = Project.find(params[:id])
    project.status_id = Status.last.id
    project_save(project)
  end

  private 
  
  def project_save(project)
    if project.save
      flash[:success] = 'Proyecto actualizado'
    else
      flash[:danger] = 'Error al rechazar proyecto'
    end
    redirect_to professor_projects_path
  end
end
    

    