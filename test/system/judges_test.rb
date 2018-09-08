require "application_system_test_case"

class JudgesTest < ApplicationSystemTestCase
  setup do
    @judge = judges(:one)
  end

  test "visiting the index" do
    visit judges_url
    assert_selector "h1", text: "Judges"
  end

  test "creating a Judge" do
    visit judges_url
    click_on "New Judge"

    fill_in "Department", with: @judge.department
    fill_in "Email", with: @judge.email
    fill_in "Has Tablet", with: @judge.has_tablet
    fill_in "Name", with: @judge.name
    click_on "Create Judge"

    assert_text "Judge was successfully created"
    click_on "Back"
  end

  test "updating a Judge" do
    visit judges_url
    click_on "Edit", match: :first

    fill_in "Department", with: @judge.department
    fill_in "Email", with: @judge.email
    fill_in "Has Tablet", with: @judge.has_tablet
    fill_in "Name", with: @judge.name
    click_on "Update Judge"

    assert_text "Judge was successfully updated"
    click_on "Back"
  end

  test "destroying a Judge" do
    visit judges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Judge was successfully destroyed"
  end
end
