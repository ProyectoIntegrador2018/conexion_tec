class RemoveKindsTable < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :projects, :kind, index: true
  	add_reference :projects, :expertise_area, index: true
  	drop_table :kinds
  end
end
