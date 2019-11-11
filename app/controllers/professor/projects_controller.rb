class Professor::ProjectsController < Professor::BaseController
  before_action :set_project, only: [:show]
  helper_method :accepted_statuses
  
  def show
  end
      
  def index
    @projects = Project.where(professor_id: current_user.userable_id)
  end

  def approve
    project = Project.find(params[:id])
    project.status_id = Status.first.id
    project_save(project, 'Proyecto aprobado')
  end

  def reject
    project = Project.find(params[:id])
    project.status_id = Status.last.id
    project_save(project, 'Proyecto rechazado')
  end

  def accepted_statuses
    Status.where({ status: ["No calificado", 
                  "Esperando revision de Profesor", 
                  "Rechazado por profesor"]})
  end

  private 
  
  def project_save(project, message)
    if project.save
      flash[:success] = message
    else
      flash[:danger] = 'Error al actualizar proyecto'
    end
    redirect_to professor_projects_path
  end
end
    

    