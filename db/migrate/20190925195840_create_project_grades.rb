class CreateProjectGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :project_grades do |t|
      t.integer :video_grade
      t.integer :objective_grade
      t.integer :abstract_grade
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
