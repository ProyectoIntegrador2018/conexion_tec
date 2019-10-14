class Common::ProjectGradesController < Common::BaseController
  def new
    @project = Project.find(params[:project_id])
    @project_grade = ProjectGrade.new
    @url = common_project_project_grades_path
  end

  def edit
    @project = Project.find(params[:project_id])
    @project_grade = ProjectGrade.find(params[:id])
    @url = common_project_project_grade_path
  end

  def create
    @project = Project.find(params[:project_id])
    @project_grade = ProjectGrade.create(form_params)
    @project.project_grade = @project_grade
    flash[:success] = 'Proyecto calificado exitosamente'
    redirect_to common_projects_path
  end

  def update
    @project = Project.find(params[:project_id])
    @project_grade = ProjectGrade.find(params[:id])
    @project_grade.update(form_params)
    @project.project_grade = @project_grade
    flash[:success] = 'Proyecto calificado exitosamente'
    redirect_to common_projects_path
  end

  private

  def form_params
    params.require(:project_grade).
    permit(:abstract,
           :description,
           :abstract_impact,
           :abstract_problem,
           :abstract_results,
           :abstract_methodology,
           :abstract_feasibility)
  end
end