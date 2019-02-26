class AddResultToEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :result, :float
  end
end
