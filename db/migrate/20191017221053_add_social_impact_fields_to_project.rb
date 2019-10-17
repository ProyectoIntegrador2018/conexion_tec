class AddSocialImpactFieldsToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :social_impact_empathy, :string
    add_column :projects, :social_impact_problem, :string
    add_column :projects, :social_impact_responsibility, :string
  end
end
