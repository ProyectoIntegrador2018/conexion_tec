class AddDepartmentIdToProfessors < ActiveRecord::Migration[5.2]
  def change
    add_column :professors, :department_id, :integer
  end
end
