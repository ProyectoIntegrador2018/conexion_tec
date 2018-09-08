class AddRelationProjectStudents < ActiveRecord::Migration[5.2]
  def change
  	add_column :students, "project_id", "integer"
  	add_index :students, "project_id"
  end
end
