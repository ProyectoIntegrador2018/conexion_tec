class Common::StandsAssignmentController < Common::BaseController
    before_action :set_project, only: [:assignStand]

    def index
		    @projects = Project.all.sort_by {|p| p.name}
    end

    def assignStand
        # byebug
        if @project.update_attributes(project_params)
            flash[:success] = 'Stand asignado'
			redirect_to action: 'index'
        else
            # byebug
			flash[:danger] = 'Error al asignar stand'
			redirect_to action: 'index'
        end
    end

    private
    def set_project
        @project = params[:id].present? ? Project.find(params[:id]) : Project.new
    end

    def project_params
        params.require(:project).permit(
            :stand_id)
    end

end
