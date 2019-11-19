class AddIntegrantesToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :integrantes, :text
  end
end
