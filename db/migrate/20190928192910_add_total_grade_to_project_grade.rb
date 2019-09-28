class AddTotalGradeToProjectGrade < ActiveRecord::Migration[5.2]
  def change
    add_column :project_grades, :total_grade, :integer
  end
end
