class AddNameToProfessor < ActiveRecord::Migration[5.2]
  def change
  	add_column :professors, :name, :string
  end
end
