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
end
