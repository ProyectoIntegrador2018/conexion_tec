class DatesForApprovingProjectsOnEditions < ActiveRecord::Migration[5.2]
  def change
  	add_column :editions, :project_approval_starting_date, :date
  	add_column :editions, :project_approval_ending_date, :date
  end
end
