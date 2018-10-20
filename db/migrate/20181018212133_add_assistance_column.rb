class AddAssistanceColumn < ActiveRecord::Migration[5.2]
  def change
	add_column :projects, :assistance, :boolean, default: false
	add_column :projects, :active, :boolean, default: false
  end
end
