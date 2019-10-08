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
    @project_grade.total_grade = total_grade
    @project.project_grade = @project_grade
    flash[:success] = 'Proyecto calificado exitosamente'
    redirect_to common_projects_path
  end

  def update
    @project = Project.find(params[:project_id])
    @project_grade = ProjectGrade.find(params[:id])
    @project_grade.update(form_params)
    @project_grade.update(total_grade: total_grade)
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

  def total_grade
    params[:project_grade][:abstract].to_i +
    params[:project_grade][:description].to_i  +
    params[:project_grade][:abstract_impact].to_i +
    params[:project_grade][:abstract_problem].to_i +
    params[:project_grade][:abstract_results].to_i +
    params[:project_grade][:abstract_methodology].to_i +
    params[:project_grade][:abstract_feasibility].to_i
  end
end