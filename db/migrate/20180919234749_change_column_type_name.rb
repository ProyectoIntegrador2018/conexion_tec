class ChangeColumnTypeName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :projects, :type, :kind
  end
end
