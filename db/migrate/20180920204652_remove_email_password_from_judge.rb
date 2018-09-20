class RemoveEmailPasswordFromJudge < ActiveRecord::Migration[5.2]
  def change
  	remove_column :judges, :password
  	remove_column :judges, :email 
  	remove_column :projects, :password
  	remove_column :projects, :email
  	remove_column :projects, :password_digest
   end
end
