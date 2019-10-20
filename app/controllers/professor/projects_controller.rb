class Professor::ProjectsController < Professor::BaseController
    before_action :set_project, only: [:show]
    
    def show
    end
        
    def index
        @projects = Project.where(professor_id: current_user.userable_id)
    end

    def approve
      @project.status_id = Status.last.id
      if @project.save
        flash[:success] = 'Proyecto aprobado'
        redirect_to common_projects_path
      else
        flash[:danger] = 'Error al aprobar proyecto'
        redirect_to common_projects_path
      end
    end
  
    def reject
      @project.status_id = Status.third.id
      if @project.save
        flash[:success] = 'Proyecto rechazado'
        redirect_to common_projects_path
      else
        flash[:danger] = 'Error al rechazar proyecto'
        redirect_to common_projects_path
      end
    end
end
    

    