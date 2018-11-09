class ChangeScoreColumnToDecimal < ActiveRecord::Migration[5.2]
  def change
  	change_column :projects, :score, :decimal, default: 0.0
  end
end
