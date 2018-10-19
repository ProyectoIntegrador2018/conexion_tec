class AddScoreColumnToProject < ActiveRecord::Migration[5.2]
  def change
  	add_column :projects, :score, :integer
  end
end
