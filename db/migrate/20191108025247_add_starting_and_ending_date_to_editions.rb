class AddStartingAndEndingDateToEditions < ActiveRecord::Migration[5.2]
  def change
    add_column :editions, :starting_date, :date
    add_column :editions, :ending_date, :date
  end
end
