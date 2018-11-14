class MoveReferenceFromEventDatesToProject < ActiveRecord::Migration[5.2]
  def change
  	remove_reference :event_dates, :project, index: true
  	add_reference :projects, :event_date, index:true 
  end
end
