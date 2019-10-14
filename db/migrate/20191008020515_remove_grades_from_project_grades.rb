class RemoveGradesFromProjectGrades < ActiveRecord::Migration[5.2]
  def change
  	remove_column :project_grades, :video_grade, :integer
  	remove_column :project_grades, :abstract_grade, :integer
  	remove_column :project_grades, :objective_grade, :integer
  end
end
