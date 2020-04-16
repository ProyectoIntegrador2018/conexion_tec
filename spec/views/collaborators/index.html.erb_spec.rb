require 'rails_helper'

RSpec.describe "collaborators/index", type: :view do
  before(:each) do
    assign(:collaborators, [
      Collaborator.create!(
        :name => "Name",
        :email => "Email",
        :student_code => "Student Code",
        :major => nil,
        :project => nil
      ),
      Collaborator.create!(
        :name => "Name",
        :email => "Email",
        :student_code => "Student Code",
        :major => nil,
        :project => nil
      )
    ])
  end

  it "renders a list of collaborators" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Student Code".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
