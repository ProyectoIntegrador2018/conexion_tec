class AddIdToEvaluationQuestions < ActiveRecord::Migration[5.2]
  def change
  	add_column :evaluation_questions, :id, :primary_key
  end
end
