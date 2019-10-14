class AddGradesToProjectGrades < ActiveRecord::Migration[5.2]
  def change
    add_column :project_grades, :abstract, :integer
    add_column :project_grades, :description, :integer
    add_column :project_grades, :abstract_impact, :integer
    add_column :project_grades, :abstract_problem, :integer
    add_column :project_grades, :abstract_results, :integer
    add_column :project_grades, :abstract_methodology, :integer
    add_column :project_grades, :abstract_feasibility, :integer
  end
end
