class AddIntegrantesToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :integrantes, :text
  end
end
