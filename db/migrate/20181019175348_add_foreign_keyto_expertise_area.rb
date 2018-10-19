class AddForeignKeytoExpertiseArea < ActiveRecord::Migration[5.2]
  def change
  	create_table :expertise_areas_judges do |t|
  		t.belongs_to :expertise_area, index:true
  		t.belongs_to :judge, index:true
  	end
  end
end
