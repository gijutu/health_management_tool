require "application_system_test_case"

class SignsTest < ApplicationSystemTestCase
  setup do
    @sign = signs(:one)
  end

  test "visiting the index" do
    visit signs_url
    assert_selector "h1", text: "Signs"
  end

  test "creating a Sign" do
    visit signs_url
    click_on "New Sign"

    click_on "Create Sign"

    assert_text "Sign was successfully created"
    click_on "Back"
  end

  test "updating a Sign" do
    visit signs_url
    click_on "Edit", match: :first

    click_on "Update Sign"

    assert_text "Sign was successfully updated"
    click_on "Back"
  end

  test "destroying a Sign" do
    visit signs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sign was successfully destroyed"
  end
end
