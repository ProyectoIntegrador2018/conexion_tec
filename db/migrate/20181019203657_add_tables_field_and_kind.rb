class AddTablesFieldAndKind < ActiveRecord::Migration[5.2]
  def change
  	create_table :kinds do |t|
      t.string :name
      t.timestamps
    end

    add_reference :projects, :kind, index: true
  end
end
