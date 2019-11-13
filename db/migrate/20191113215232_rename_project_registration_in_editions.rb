class RenameProjectRegistrationInEditions < ActiveRecord::Migration[5.2]
  def change
  	rename_column :editions, :registry_open, :project_registration_starting_date
  	rename_column :editions, :registry_limit, :project_registration_ending_date
  end
end
