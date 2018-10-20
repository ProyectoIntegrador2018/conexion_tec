class RemoveColumnKindFromProject < ActiveRecord::Migration[5.2]
  def change
  	remove_column :projects, :kind
  end
end
