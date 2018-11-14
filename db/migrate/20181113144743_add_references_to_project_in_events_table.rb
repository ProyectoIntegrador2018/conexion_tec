class AddReferencesToProjectInEventsTable < ActiveRecord::Migration[5.2]
  def change
  	add_reference :event_dates, :project, index:true
  end
end
