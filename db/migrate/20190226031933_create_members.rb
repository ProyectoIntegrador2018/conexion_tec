class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :email
      t.string :name
      t.integer :major_id
      t.integer :project_id
    end
  end
end
