require 'rails_helper'

RSpec.describe EventDate, :type => :model do

	it "has many projects" do
		association = described_class.reflect_on_association(:projects)
	end
end