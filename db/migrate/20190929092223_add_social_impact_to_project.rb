class AddSocialImpactToProject < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :social_impact, :bool
  end
end
