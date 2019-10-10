class ProjectGrade < ApplicationRecord
  belongs_to :project

  validates :abstract,
            :description,
            :total_grade,
            :abstract_impact,
            :abstract_problem,
            :abstract_results,
            :abstract_methodology,
            :abstract_feasibility,
            presence: true

  after_initialize do |project_grade|
    project_grade.total_grade = project_grade.abstract.to_i +
                                project_grade.description.to_i +
                                project_grade.abstract_impact.to_i +
                                project_grade.abstract_problem.to_i +
                                project_grade.abstract_results.to_i +
                                project_grade.abstract_methodology.to_i +
                                project_grade.abstract_feasibility.to_i
  end

  after_update do |project_grade|
    project_grade.total_grade = project_grade.abstract.to_i +
                                project_grade.description.to_i +
                                project_grade.abstract_impact.to_i +
                                project_grade.abstract_problem.to_i +
                                project_grade.abstract_results.to_i +
                                project_grade.abstract_methodology.to_i +
                                project_grade.abstract_feasibility.to_i
  end
end
