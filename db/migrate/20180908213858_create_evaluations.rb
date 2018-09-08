class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.numeric :total

      t.timestamps
    end
  end
end
