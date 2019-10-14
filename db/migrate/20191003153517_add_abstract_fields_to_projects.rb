class AddAbstractFieldsToProjects < ActiveRecord::Migration[5.2]
  def change
  	add_column :projects, :abstract_impact, :string
  	add_column :projects, :abstract_problem, :string
  	add_column :projects, :abstract_results, :string
  	add_column :projects, :abstract_methodology, :string
  	add_column :projects, :abstract_feasibility, :string
  end
end
