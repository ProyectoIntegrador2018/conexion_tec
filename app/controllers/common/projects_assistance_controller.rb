class Common::ProjectsAssistanceController < Common::BaseController
  include AttendanceHelper

  before_action :set_project, only: [:mark_assistance, :block]

  def index
    @projects = Project.all.sort_by { |project| project.name.downcase }
  end

  def mark_assistance
    flash[:success] = project_attendance(@project) ?
                      'Asistencia registrada' :
                      'Asistencia retirada'
    redirect_to common_projects_assistance_path
  end

  def block
    flash[:success] = block_project(@project) ?
                      'Proyecto bloqueado' :
                      'Proyecto desbloqueado'
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
