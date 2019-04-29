class ChangeAbstractType < ActiveRecord::Migration[5.2]
  def change
    change_column :projects, :abstract, :text
    change_column :projects, :description, :text
  end
end
