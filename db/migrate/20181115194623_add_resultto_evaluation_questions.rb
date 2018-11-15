class AddResulttoEvaluationQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluation_questions, :result, :integer, default: 0
  end
end
