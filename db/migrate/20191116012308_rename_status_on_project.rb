class RenameStatusOnProject < ActiveRecord::Migration[5.2]
  def change
  	rename_column :projects, :status, :current_status
  end
end
