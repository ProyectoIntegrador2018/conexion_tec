class RemoveColumnsFromProfessors < ActiveRecord::Migration[5.2]
  def change
  	remove_column :professors, :enrollment
  	remove_column :professors, :email
  	remove_column :professors, :department
  	remove_column :professors, :name
  	remove_column :professors, :course_code
  	remove_column :professors, :project_id
  end
end
