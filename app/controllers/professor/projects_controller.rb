class Professor::ProjectsController < Professor::BaseController
    before_action :set_project, only: [:show]
    
    def show
    end
        
    def index
      @projects = Project.where(professor_id: current_user.userable_id)
    end

    def approve
      @project = Project.find(params[:id])
      @project.status_id = Status.first.id
      if @project.save
        flash[:success] = 'Proyecto aprobado'
        redirect_to professor_projects_path
      else
        flash[:danger] = 'Error al aprobar proyecto'
        redirect_to professor_projects_path
      end
    end
  
    def reject
      @project = Project.find(params[:id])
      @project.status_id = Status.last.id
      if @project.save
        flash[:success] = 'Proyecto rechazado'
        redirect_to professor_projects_path
      else
        flash[:danger] = 'Error al rechazar proyecto'
        redirect_to professor_projects_path
      end
    end
end
    

    