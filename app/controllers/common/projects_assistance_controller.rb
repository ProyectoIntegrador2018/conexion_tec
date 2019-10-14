class Common::ProjectsAssistanceController < Common::BaseController
  include AttendanceHelper

  before_action :set_project, only: [:mark_assistance, :block]

  def index
    @projects = Project.all.sort_by { |project| project.name.downcase }
  end

  def mark_assistance
    flash[:success] = if project_attendance(@project)
                        'Asistencia registrada'
                      else
                        'Asistencia retirada'
                      end
    redirect_to common_projects_assistance_path
  end

  def block
    flash[:success] = if block_project(@project)
                        'Proyecto bloqueado'
                      else
                        'Proyecto desbloqueado'
                      end
    redirect_to common_projects_assistance_path
  end

  private

  def set_project
    @project = params[:id].present? ? Project.find(params[:id]) : Project.new
  end

  def project_params
    params.require(:project).permit(:stand_id)
  end
end
