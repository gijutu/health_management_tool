require "application_system_test_case"

class AttentionsTest < ApplicationSystemTestCase
  setup do
    @attention = attentions(:one)
  end

  test "visiting the index" do
    visit attentions_url
    assert_selector "h1", text: "Attentions"
  end

  test "creating a Attention" do
    visit attentions_url
    click_on "New Attention"

    fill_in "Content", with: @attention.content
    click_on "Create Attention"

    assert_text "Attention was successfully created"
    click_on "Back"
  end

  test "updating a Attention" do
    visit attentions_url
    click_on "Edit", match: :first

    fill_in "Content", with: @attention.content
    click_on "Update Attention"

    assert_text "Attention was successfully updated"
    click_on "Back"
  end

  test "destroying a Attention" do
    visit attentions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attention was successfully destroyed"
  end
end
