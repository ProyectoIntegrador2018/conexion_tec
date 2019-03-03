class AddMajorIdToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :major_id, :integer
  end
end
