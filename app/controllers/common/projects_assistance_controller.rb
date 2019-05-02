class Common::ProjectsAssistanceController < Common::BaseController
    include AttendanceHelper

    before_action :set_project, only: [:mark_assistance, :block]

    def index
        @projects = Project.all
    end
    
    def mark_assistance
        if projectAttendance(@project)
            flash[:success] = "Asistencia del proyecto registrada"
        else
            flash[:success] = "Asistencia del proyecto retirada"
        end
        redirect_to common_projects_assistance_path
    end

    def block
        if blockProject(@project)
            flash[:success] = "Proyecto bloquedo"
        else
            flash[:success] = "Proyecto desbloqueado"
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