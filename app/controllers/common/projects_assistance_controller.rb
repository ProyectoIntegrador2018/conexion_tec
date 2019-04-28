class Common::ProjectsAssistanceController < Common::BaseController
    before_action :set_project, only: [:mark_assistance]

    def index
        @projects = Project.all
    end
    
    def mark_assistance
        # @project.sta
        # byebug
        if @project.update_attributes(project_params)
            flash[:success] = "Información del proyecto actualizada"
            redirect_to action: 'index'
        else
            # byebug
            flash[:error] = "Error: No se pudo asignar el stand seleccionado, intentelo nuevamente"
            redirect_to action: 'index'
        end
    end

    private
		def set_project
            @project = params[:id].present? ? Project.find(params[:id]) : Project.new
            byebug
		end

		def project_params
			params.require(:project).permit(
                :stand_id)
		end

end