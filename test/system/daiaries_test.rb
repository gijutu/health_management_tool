require "application_system_test_case"

class DaiariesTest < ApplicationSystemTestCase
  setup do
    @daiary = daiaries(:one)
  end

  test "visiting the index" do
    visit daiaries_url
    assert_selector "h1", text: "Daiaries"
  end

  test "creating a Daiary" do
    visit daiaries_url
    click_on "New Daiary"

    fill_in "Name", with: @daiary.name
    fill_in "Start time", with: @daiary.start_time
    click_on "Create Daiary"

    assert_text "Daiary was successfully created"
    click_on "Back"
  end

  test "updating a Daiary" do
    visit daiaries_url
    click_on "Edit", match: :first

    fill_in "Name", with: @daiary.name
    fill_in "Start time", with: @daiary.start_time
    click_on "Update Daiary"

    assert_text "Daiary was successfully updated"
    click_on "Back"
  end

  test "destroying a Daiary" do
    visit daiaries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Daiary was successfully destroyed"
  end
end
