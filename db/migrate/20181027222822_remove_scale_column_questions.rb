class RemoveScaleColumnQuestions < ActiveRecord::Migration[5.2]
  def change
  	remove_column :questions, :scale
  end
end
