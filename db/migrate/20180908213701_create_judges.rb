class CreateJudges < ActiveRecord::Migration[5.2]
  def change
    create_table :judges do |t|
      t.boolean :has_tablet
      t.integer :department
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
