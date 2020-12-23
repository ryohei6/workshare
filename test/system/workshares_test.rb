require "application_system_test_case"

class WorksharesTest < ApplicationSystemTestCase
  setup do
    @workshare = workshares(:one)
  end

  test "visiting the index" do
    visit workshares_url
    assert_selector "h1", text: "Workshares"
  end

  test "creating a Workshare" do
    visit workshares_url
    click_on "New Workshare"

    fill_in "Body", with: @workshare.body
    fill_in "Title", with: @workshare.title
    click_on "Create Workshare"

    assert_text "Workshare was successfully created"
    click_on "Back"
  end

  test "updating a Workshare" do
    visit workshares_url
    click_on "Edit", match: :first

    fill_in "Body", with: @workshare.body
    fill_in "Title", with: @workshare.title
    click_on "Update Workshare"

    assert_text "Workshare was successfully updated"
    click_on "Back"
  end

  test "destroying a Workshare" do
    visit workshares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Workshare was successfully destroyed"
  end
end
