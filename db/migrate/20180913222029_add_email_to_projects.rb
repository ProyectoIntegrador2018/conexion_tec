class AddEmailToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :email, :string
  end
end
