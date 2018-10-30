class RenameColumnQuestionsToQuestion < ActiveRecord::Migration[5.2]
  def change
  	rename_column :evaluations_questions, :questions_id, :question_id
  end
end
