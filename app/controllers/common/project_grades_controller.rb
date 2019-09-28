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
    flash[:success] = "Proyecto calificado"
    redirect_to common_projects_path
  end

  def update
    @project = Project.find(params[:project_id])
    @project_grade = ProjectGrade.find(params[:id])
    @project_grade.update(form_params)
    @project_grade.update(total_grade: total_grade)
    @project.project_grade = @project_grade
    flash[:success] = "Proyecto calificado"
    redirect_to common_projects_path
  end

  private

  def form_params
    params.require(:project_grade).
    permit(:abstract_grade, :video_grade, :objective_grade)
  end

  def total_grade
    params[:project_grade][:abstract_grade].to_i + params[:project_grade][:video_grade].to_i  + params[:project_grade][:objective_grade].to_i 
  end
end