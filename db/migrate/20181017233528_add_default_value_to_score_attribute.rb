class AddDefaultValueToScoreAttribute < ActiveRecord::Migration[5.2]
  def change
  	change_column :projects, :score, :integer, default: 0
  end
end
