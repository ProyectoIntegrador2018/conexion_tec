require 'rails_helper'

RSpec.describe EvaluationQuestion, :type => :model do
	it "should belongs to evaluation" do
		should belong_to(:evaluation)
	end

	it "should belongs to question" do
		should belong_to(:question)
	end
end