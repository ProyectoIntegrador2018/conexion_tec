class CreateTableEventDates < ActiveRecord::Migration[5.2]
  def change
    create_table :table_event_dates do |t|
    	t.date :event
    	t.timestamps
    end
  end
end
