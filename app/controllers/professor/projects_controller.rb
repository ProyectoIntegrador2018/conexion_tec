class Professor::ProjectsController < Professor::BaseController
    before_action :set_project, only: [:show]
    
    def show
    end
        
    def index
        @projects = Project.where(professor_id: current_user.userable_id)
    end
end
    

    