class AddReasonColumnToProject < ActiveRecord::Migration[5.2]
  def change
  	add_column :projects, :reason, :string
  end
end
