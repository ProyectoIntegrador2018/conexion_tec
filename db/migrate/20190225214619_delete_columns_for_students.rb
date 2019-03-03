class DeleteColumnsForStudents < ActiveRecord::Migration[5.2]
  def change
  	remove_column :students, :name
  	remove_column :students, :enrollment
  	remove_column :students, :email
  	remove_column :students, :major
  	remove_column :students, :project_id
  end
end