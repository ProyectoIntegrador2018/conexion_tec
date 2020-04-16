require 'rails_helper'

RSpec.describe "collaborators/new", type: :view do
  before(:each) do
    assign(:collaborator, Collaborator.new(
      :name => "MyString",
      :email => "MyString",
      :student_code => "MyString",
      :major => nil,
      :project => nil
    ))
  end

  it "renders new collaborator form" do
    render

    assert_select "form[action=?][method=?]", collaborators_path, "post" do

      assert_select "input[name=?]", "collaborator[name]"

      assert_select "input[name=?]", "collaborator[email]"

      assert_select "input[name=?]", "collaborator[student_code]"

      assert_select "input[name=?]", "collaborator[major_id]"

      assert_select "input[name=?]", "collaborator[project_id]"
    end
  end
end
