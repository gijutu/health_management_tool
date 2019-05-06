require "application_system_test_case"

class WorseConditionsTest < ApplicationSystemTestCase
  setup do
    @worse_condition = worse_conditions(:one)
  end

  test "visiting the index" do
    visit worse_conditions_url
    assert_selector "h1", text: "Worse Conditions"
  end

  test "creating a Worse condition" do
    visit worse_conditions_url
    click_on "New Worse Condition"

    fill_in "Content", with: @worse_condition.content
    click_on "Create Worse condition"

    assert_text "Worse condition was successfully created"
    click_on "Back"
  end

  test "updating a Worse condition" do
    visit worse_conditions_url
    click_on "Edit", match: :first

    fill_in "Content", with: @worse_condition.content
    click_on "Update Worse condition"

    assert_text "Worse condition was successfully updated"
    click_on "Back"
  end

  test "destroying a Worse condition" do
    visit worse_conditions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Worse condition was successfully destroyed"
  end
end
