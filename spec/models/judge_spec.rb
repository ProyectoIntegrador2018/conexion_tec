require 'rails_helper'

RSpec.describe Judge, :type => :model do

	subject {described_class.new(has_tablet: true, department: 1, name: "Jorge")}

	it "should belongs to user" do
		should belong_to(:user)
	end

	it "has many evaluations" do
		association = described_class.reflect_on_association(:evaluations)
		expect(association.macro).to eq :has_many
	end

	it "has and belongs to many expertise areas" do
		should have_and_belong_to_many(:expertise_areas)
	end

	it "has many projects through evaluations" do
		should have_many(:projects).through(:evaluations)
	end

	it "should be invalid without a department" do
		subject.department = nil
		expect(subject).to_not be_valid
	end

	it "should be invalidad without name" do
		subject.name = nil
		expect(subject).to_not be_valid
	end
end