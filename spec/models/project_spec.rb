require 'rails_helper'

RSpec.describe Project, :type => :model do

	it "should belongs to user" do
		should belong_to(:user)
	end

	it "should belongs to expertise area" do
		should belong_to(:expertise_area)
	end

	it "should belongs to category" do
		should belong_to(:category)
	end

	it "should belongs to event_date" do
		should belong_to(:event_date)
	end

end