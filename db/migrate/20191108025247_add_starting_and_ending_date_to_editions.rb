class AddStartingAndEndingDateToEditions < ActiveRecord::Migration[5.2]
  def change
    add_column :editions, :starting_date, :date, default: Date.today
    add_column :editions, :ending_date, :date, default: Date.today
  end
end
