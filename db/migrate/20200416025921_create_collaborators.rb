class CreateCollaborators < ActiveRecord::Migration[5.2]
  def change
    create_table :collaborators do |t|
      t.string :name
      t.string :email
      t.string :student_code
      t.references :major, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
