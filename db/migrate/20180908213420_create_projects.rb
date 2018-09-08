class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :password
      t.integer :field
      t.integer :type
      t.integer :client
      t.string :abstract
      t.string :video_url

      t.timestamps
    end
  end
end
