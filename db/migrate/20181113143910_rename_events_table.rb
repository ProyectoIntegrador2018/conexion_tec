class RenameEventsTable < ActiveRecord::Migration[5.2]
  def change
  	rename_table :table_event_dates, :event_dates
  end
end
