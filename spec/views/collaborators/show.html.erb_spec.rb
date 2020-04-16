require 'rails_helper'

RSpec.describe "collaborators/show", type: :view do
  before(:each) do
    @collaborator = assign(:collaborator, Collaborator.create!(
      :name => "Name",
      :email => "Email",
      :student_code => "Student Code",
      :major => nil,
      :project => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Student Code/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
