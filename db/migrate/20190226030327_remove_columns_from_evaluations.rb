class RemoveColumnsFromEvaluations < ActiveRecord::Migration[5.2]
  def change
  	remove_column :evaluations, :total
  	remove_column :evaluations, :project_id
  	remove_column :evaluations, :judge_id
  end
end
