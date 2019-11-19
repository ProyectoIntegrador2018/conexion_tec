class RemoveIntegrantesFromStudent < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :integrantes, :text
  end
end
