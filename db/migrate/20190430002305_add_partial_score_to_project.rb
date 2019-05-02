class AddPartialScoreToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :partial_score, :float, default: 0
  end
end
