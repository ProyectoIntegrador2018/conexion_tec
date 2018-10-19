class AddExpertiseAreasTable < ActiveRecord::Migration[5.2]
  def change
  	create_table :expertise_areas do |t|
  		t.string "area"
  	end
  end
end
