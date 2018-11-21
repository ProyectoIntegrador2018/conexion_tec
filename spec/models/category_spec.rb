require 'rails_helper'

RSpec.describe Category, :type => :model do
	subject { described_class.new }

	it "has many projects" do
		association = described_class.reflect_on_association(:projects)
		expect(association.macro).to eq :has_many
	end

	it "has many questions" do
		association = described_class.reflect_on_association(:questions)
		expect(association.macro).to eq :has_many
	end
end