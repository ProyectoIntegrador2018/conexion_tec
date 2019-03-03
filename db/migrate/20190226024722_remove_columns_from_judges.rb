class RemoveColumnsFromJudges < ActiveRecord::Migration[5.2]
  def change
  	remove_column :judges, :department
  	remove_column :judges, :name
  	remove_column :judges, :user_id
  end
end
