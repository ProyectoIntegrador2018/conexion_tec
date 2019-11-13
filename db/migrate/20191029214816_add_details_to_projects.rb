class AddDetailsToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :team_size, :integer
    add_reference :projects, :campus, foreign_key: true
  end
end
