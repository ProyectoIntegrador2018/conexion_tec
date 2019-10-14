class Common::AssignmentsController < Common::BaseController
  def index
    if params[:judge_id].present?
      judge = Judge.find(params[:judge_id])
      @projects = available_projects(judge).sort_by { |project| project.name.downcase }
    end
    @judges = Judge.available_judges
  end

  def create
    judge_id = assignment_params[:judge_id]
    assignment = Assignment.new(assignment_params)
    if assignment.save
      flash[:success] = 'Juez asignado correctamente'
      redirect_to action: 'index', judge_id: judge_id
    else
      flash[:danger] = 'Error al asignar juez'
      redirect_to action: 'index', judge_id: judge_id
    end
  end

  private

  def available_projects(judge)
    assignments = judge.assignments
    projects_assigned = assignments.map(&:project_id)
    areas = judge.expertise_areas.map(&:id)
    projects = Project.where.not(id: projects_assigned)
    projects = projects.where(status_id: Status.last.id)
                       .where(attended: 1)
                       .where(expertise_area_id: areas)
    projects
  end

  def assignment_params
    params.permit(:judge_id,
                  :project_id)
  end
end
