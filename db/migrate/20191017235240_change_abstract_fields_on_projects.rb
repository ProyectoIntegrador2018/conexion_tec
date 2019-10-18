class ChangeAbstractFieldsOnProjects < ActiveRecord::Migration[5.2]
  def change
  	change_column :projects, :abstract_impact, :text
  	change_column :projects, :abstract_problem, :text
  	change_column :projects, :abstract_results, :text
  	change_column :projects, :abstract_methodology, :text
  	change_column :projects, :abstract_feasibility, :text
  end
end
