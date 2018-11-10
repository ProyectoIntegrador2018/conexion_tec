class RenameManyToManyRelationshipTableQuestionEvaluation < ActiveRecord::Migration[5.2]
  def change
  	rename_table :evaluations_questions, :evaluation_questions
  end
end
