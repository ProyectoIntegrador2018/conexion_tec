class AddDataToEvaluationsQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations_questions, :result, :integer, default: 0
  end
end
