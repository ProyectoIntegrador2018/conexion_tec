class AddReferencesToQuestion < ActiveRecord::Migration[5.2]
  def change
    add_reference :questions, :expertise_area, index: true 
  end
end
