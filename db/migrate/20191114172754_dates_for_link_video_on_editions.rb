class DatesForLinkVideoOnEditions < ActiveRecord::Migration[5.2]
  def change
  	rename_column :editions, :video_open, :video_link_registration_starting_date
  	rename_column :editions, :video_limit, :video_link_registration_ending_date
  end
end
