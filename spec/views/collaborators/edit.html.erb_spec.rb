require 'rails_helper'

RSpec.describe "collaborators/edit", type: :view do
  before(:each) do
    @collaborator = assign(:collaborator, Collaborator.create!(
      :name => "MyString",
      :email => "MyString",
      :student_code => "MyString",
      :major => nil,
      :project => nil
    ))
  end

  it "renders the edit collaborator form" do
    render

    assert_select "form[action=?][method=?]", collaborator_path(@collaborator), "post" do

      assert_select "input[name=?]", "collaborator[name]"

      assert_select "input[name=?]", "collaborator[email]"

      assert_select "input[name=?]", "collaborator[student_code]"

      assert_select "input[name=?]", "collaborator[major_id]"

      assert_select "input[name=?]", "collaborator[project_id]"
    end
  end
end
