module Common::ProjectsHelper
  def projects_with_grade
    Project.select { |project| project.project_grade.present? }
  end

  def projects_without_grade
    Project.select { |project| project.project_grade.nil? }
  end

  def sort_by_name(projects)
    projects.sort_by { |project| project.name.downcase }
  end

  def sort_by_grade(projects)
    projects.sort_by { |project| project.project_grade.total_grade }.reverse
  end

  def approved(project)
    project.current_status == 'Aprobado'
  end
end
