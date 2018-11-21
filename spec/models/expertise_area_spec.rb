require 'rails_helper'

RSpec.describe ExpertiseArea, :type => :model do

	it "has many projects" do
		association = described_class.reflect_on_association(:projects)
		expect(association.macro).to eq :has_many
	end

	it "has and belongs to many judges" do
		association = described_class.reflect_on_association(:judges)
		expect(association.macro).to eq :has_and_belongs_to_many
	end
end