class AddStandField < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :stand, :string
  end
end
