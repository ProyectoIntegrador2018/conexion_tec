class CreateCampuses < ActiveRecord::Migration[5.2]
  def change
    create_table :campus do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end
end
