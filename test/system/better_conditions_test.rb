require "application_system_test_case"

class BetterConditionsTest < ApplicationSystemTestCase
  setup do
    @better_condition = better_conditions(:one)
  end

  test "visiting the index" do
    visit better_conditions_url
    assert_selector "h1", text: "Better Conditions"
  end

  test "creating a Better condition" do
    visit better_conditions_url
    click_on "New Better Condition"

    fill_in "Content", with: @better_condition.content
    fill_in "String", with: @better_condition.string
    click_on "Create Better condition"

    assert_text "Better condition was successfully created"
    click_on "Back"
  end

  test "updating a Better condition" do
    visit better_conditions_url
    click_on "Edit", match: :first

    fill_in "Content", with: @better_condition.content
    fill_in "String", with: @better_condition.string
    click_on "Update Better condition"

    assert_text "Better condition was successfully updated"
    click_on "Back"
  end

  test "destroying a Better condition" do
    visit better_conditions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Better condition was successfully destroyed"
  end
end
