class CreateProfessors < ActiveRecord::Migration[5.2]
  def change
    create_table :professors do |t|
      t.string :enrollment
      t.string :email
      t.integer :department

      t.timestamps
    end
  end
end
