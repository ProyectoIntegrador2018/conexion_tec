class AddCourseCodeToProfessor < ActiveRecord::Migration[5.2]
  def change
    add_column :professors, :course_code, :string
  end
end
