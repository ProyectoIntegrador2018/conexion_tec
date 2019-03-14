class RemoveFieldFromUsers < ActiveRecord::Migration[5.2]
  def change
  	remove_column :users, :crypted_password
  	remove_column :users, :salt
  end
end
