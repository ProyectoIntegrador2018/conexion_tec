class AddJudgeRegistryFields < ActiveRecord::Migration[5.2]
  def change
    add_column :judges, :external, :boolean, default: false
    add_column :judges, :ex_nombreEmpresaExterna, :string, null: true
    add_column :judges, :ex_contactName, :string, null: true
    add_column :judges, :ex_contactEmail, :string, null: true
  end
end
