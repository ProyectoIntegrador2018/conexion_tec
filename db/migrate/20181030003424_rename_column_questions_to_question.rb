class RenameColumnQuestionsToQuestion < ActiveRecord::Migration[5.2]
  def change
  	drop_table :evaluations_questions
  	create_join_table :evaluations, :questions do |t|
  		t.index :evaluation_id
  		t.index :question_id
  	end
  end
end
