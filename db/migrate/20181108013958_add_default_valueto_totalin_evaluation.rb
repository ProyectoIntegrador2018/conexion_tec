class AddDefaultValuetoTotalinEvaluation < ActiveRecord::Migration[5.2]
  def change
    change_column :evaluations,:total,:decimal, :default => 0
  end
end
