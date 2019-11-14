class DatesForProjectsEditionOnEditions < ActiveRecord::Migration[5.2]
  def change
  	add_column :editions, :project_edition_starting_date, :date
  	add_column :editions, :project_edition_ending_date, :date
  end
end
