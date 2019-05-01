class Common::ProjectsAssistanceController < Common::BaseController
    include AttendanceHelper

    before_action :set_project, only: [:mark_assistance]

    def index
        @projects = Project.all
    end
    
    def mark_assistance
        if attendance(@project)
            flash[:success] = "Asistencia del proyecto registrada"
        else
            flash[:success] = "Asistencia del proyecto retirada"
        end
        redirect_to common_projects_assistance_path
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