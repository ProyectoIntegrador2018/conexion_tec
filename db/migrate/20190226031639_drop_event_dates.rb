class DropEventDates < ActiveRecord::Migration[5.2]
  def change
  	drop_table :event_dates
  end
end
