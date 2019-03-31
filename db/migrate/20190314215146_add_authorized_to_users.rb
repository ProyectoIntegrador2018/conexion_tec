class AddAuthorizedToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :authorized, :boolean, default: false
  end
end
