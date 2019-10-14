class RemoveAbstractFromProject < ActiveRecord::Migration[5.2]
  def change
  	remove_column :projects, :abstract, :string
  end
end
