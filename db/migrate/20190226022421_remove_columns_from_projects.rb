class RemoveColumnsFromProjects < ActiveRecord::Migration[5.2]
  def change
  	remove_column :projects, :field
  	remove_column :projects, :client
  	remove_column :projects, :user_id
  	remove_column :projects, :status
  	remove_column :projects, :score
  	remove_column :projects, :assistance
  	remove_column :projects, :active
  	remove_column :projects, :reason
  	remove_column :projects, :num_evaluations
  	remove_column :projects, :num_assignments
  	remove_column :projects, :event_date_id
  	remove_column :projects, :stand
  end
end
