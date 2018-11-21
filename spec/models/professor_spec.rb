require 'rails_helper'

RSpec.describe Professor, :type => :model do
	it "should belongs to project" do
		should belong_to(:project)
	end
end