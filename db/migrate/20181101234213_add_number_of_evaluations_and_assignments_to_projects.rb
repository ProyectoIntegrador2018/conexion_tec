class AddNumberOfEvaluationsAndAssignmentsToProjects < ActiveRecord::Migration[5.2]
  def change
  	add_column :projects, :num_evaluations, :integer, :default => 0
  	add_column :projects, :num_assignments, :integer, :default => 0
  end
end
