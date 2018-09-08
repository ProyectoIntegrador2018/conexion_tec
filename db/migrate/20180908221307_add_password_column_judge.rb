class AddPasswordColumnJudge < ActiveRecord::Migration[5.2]
  def change
  	add_column :judges, :password, :string
  end
end
