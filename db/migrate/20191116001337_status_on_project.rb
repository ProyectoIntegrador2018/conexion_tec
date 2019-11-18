class StatusOnProject < ActiveRecord::Migration[5.2]
  def change
  	rename_column :projects, :status_id, :status
  end
end
