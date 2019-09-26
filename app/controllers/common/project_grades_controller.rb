class Common::ProjectGradesController < Common::BaseController
  
  def new
    @project = Project.find(params[:project_id])
    @project_grade = ProjectGrade.new
    @url = common_project_project_grades_path
  end

  def edit

  end

  def create

  end

  def update

  end
end