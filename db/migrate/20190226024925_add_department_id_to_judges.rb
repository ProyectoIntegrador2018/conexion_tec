class AddDepartmentIdToJudges < ActiveRecord::Migration[5.2]
  def change
    add_column :judges, :department_id, :integer
  end
end
