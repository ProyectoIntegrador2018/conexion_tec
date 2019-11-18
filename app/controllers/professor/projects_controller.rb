class Professor::ProjectsController < Professor::BaseController
  include Professor::ProjectsHelper

  before_action :set_project, only: [:show]

  def show
  end

  def index
    @projects = Project.where(professor_id: current_user.userable_id)
  end

  def edit
    redirect_to action: 'index' unless can_edit_project
    @project = Project.find(params[:id])
    @url = professor_project_path
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:success] = 'Información del proyecto actualizada'
      redirect_to action: 'index'
    else
      flash[:error] = 'Error'
      render 'edit'
    end
  end

  def approve
    if can_approve_project
      project = Project.find(params[:id])
      project.current_status = 'Aprobado'
      project_save(project, 'Proyecto aprobado')
    end
  end

  def reject
    if can_approve_project
      project = Project.find(params[:id])
      project.current_status = 'Rechazado'
      project_save(project, 'Proyecto rechazado')
    end
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

  def project_params
    params.require(:project).permit(:name,
                                    :field_id,
                                    :campus_id,
                                    :client_id,
                                    :semestrei,
                                    :team_size,
                                    :video_url,
                                    :category_id,
                                    :description,
                                    :social_impact,
                                    :name_professor,
                                    :abstract_impact,
                                    :email_professor,
                                    :abstract_problem,
                                    :abstract_results,
                                    :expertise_area_id,
                                    :abstract_methodology,
                                    :abstract_feasibility,
                                    :department_professor,
                                    :social_impact_empathy,
                                    :social_impact_problem,
                                    :social_impact_responsibility)
  end
end
