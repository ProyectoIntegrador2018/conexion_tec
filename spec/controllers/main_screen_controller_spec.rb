require 'rails_helper'

RSpec.describe "main screen", :type => :request do
	it "displays the admin login form after click on login admin button" do
		visit "/"
		click_button "Login administrador"
		expect(page).to have_field("email")
		expect(page).to have_field("password")
	end

	it "displays the project login form after click on login project button" do
		visit "/"
		click_button "Login Proyecto"
		expect(page).to have_field("email")
		expect(page).to have_field("password")
	end

	it "displays the judge login form after click on login judge button" do
		visit "/"
		click_button "Login Juez"
		expect(page).to have_field("email")
		expect(page).to have_field("password")
	end

	it "displays the project sign up form after click on project sign up" do
		visit "/"
		click_button "Registro Proyecto"
		expect(page).to have_field("user_project_attributes_name")
		expect(page).to have_select("user_project_attributes_category_id")
		expect(page).to have_select("user_project_attributes_field")
		expect(page).to have_select("user_project_attributes_expertise_area_id")
		expect(page).to have_select("user_project_attributes_client")
		expect(page).to have_field("user_project_attributes_description")
		expect(page).to have_field("user_project_attributes_abstract")
		expect(page).to have_field("user_email")
		expect(page).to have_field("user_password")
		expect(page).to have_field("user_password_confirmation")
	end

	it "displays the judge sign up form after clic on judge sign up" do
		visit "/"
		click_button "Registro Juez"
		expect(page).to have_field("user_email")
		expect(page).to have_field("user_password")
		expect(page).to have_field("user_password_confirmation")
		expect(page).to have_field("user_judge_attributes_name")
		expect(page).to have_field("user_judge_attributes_has_tablet")
		expect(page).to have_field("user_judge_attributes_department")
	end
end