class AddAttendanceField < ActiveRecord::Migration[5.2]
  def change
    add_column :judges, :attended, :boolean, default: false
    add_column :projects, :attended, :boolean, default: false
  end
end
