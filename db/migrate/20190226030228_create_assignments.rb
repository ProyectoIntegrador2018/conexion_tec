class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :judge_id
      t.integer :project_id
    end
  end
end
