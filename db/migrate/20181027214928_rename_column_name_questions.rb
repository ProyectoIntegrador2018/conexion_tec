class RenameColumnNameQuestions < ActiveRecord::Migration[5.2]
  def change
  	rename_column :questions, :name, :text
  end
end
