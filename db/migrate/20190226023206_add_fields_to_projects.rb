class AddFieldsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :selection_score, :float
    add_column :projects, :evaluation_score, :float
    add_column :projects, :professor_id, :integer
    add_column :projects, :student_id, :integer
    add_column :projects, :field_id, :integer
    add_column :projects, :client_id, :integer
    add_column :projects, :status_id, :integer
    add_column :projects, :edition_id, :integer
  end
end
