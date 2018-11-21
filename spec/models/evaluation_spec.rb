require 'rails_helper'

RSpec.describe Evaluation, :type => :model do

	it "should belong to judge" do
		should belong_to(:judge)
	end

	it "should belong to project" do
		should belong_to(:project)
	end

	it "has many evaluation_questions" do
		association = described_class.reflect_on_association(:evaluation_questions)
		expect(association.macro).to eq :has_many
	end

	it "has many questions" do
		association = described_class.reflect_on_association(:questions)
		expect(association.macro).to eq :has_many
	end
end