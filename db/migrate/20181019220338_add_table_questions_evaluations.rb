class AddTableQuestionsEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations_questions do |t|
      t.belongs_to :evaluation, index:true
      t.belongs_to :questions, index:true
      t.timestamps
    end
  end
end
