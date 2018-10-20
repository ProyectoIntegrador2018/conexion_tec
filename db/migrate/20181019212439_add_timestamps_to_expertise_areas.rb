class AddTimestampsToExpertiseAreas < ActiveRecord::Migration[5.2]
  def change
    add_column :expertise_areas_judges, :created_at, :datetime
    add_column :expertise_areas_judges, :updated_at, :datetime
  end
end
