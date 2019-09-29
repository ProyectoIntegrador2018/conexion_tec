class AddSemestreiToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :semestrei, :bool
  end
end
