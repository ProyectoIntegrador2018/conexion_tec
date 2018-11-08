class ModifyReferencesCategoryQuestions < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :questions, :expertise_area, index: true
  	add_reference :questions, :category, index: true
  	add_reference :projects, :category, index: true
  end
end
