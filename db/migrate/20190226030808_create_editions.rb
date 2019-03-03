class CreateEditions < ActiveRecord::Migration[5.2]
  def change
    create_table :editions do |t|
      t.integer :number
      t.date :registry_open
      t.date :registry_limit
      t.date :video_open
      t.date :video_limit
    end
  end
end
