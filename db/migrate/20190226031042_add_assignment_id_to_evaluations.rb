class AddAssignmentIdToEvaluations < ActiveRecord::Migration[5.2]
  def change
  	add_column :evaluations, :assignment_id, :integer
  end
end
