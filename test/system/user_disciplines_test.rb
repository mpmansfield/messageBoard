require "application_system_test_case"

class UserDisciplinesTest < ApplicationSystemTestCase
  setup do
    @user_discipline = user_disciplines(:one)
  end

  test "visiting the index" do
    visit user_disciplines_url
    assert_selector "h1", text: "User Disciplines"
  end

  test "creating a User discipline" do
    visit user_disciplines_url
    click_on "New User Discipline"

    click_on "Create User discipline"

    assert_text "User discipline was successfully created"
    click_on "Back"
  end

  test "updating a User discipline" do
    visit user_disciplines_url
    click_on "Edit", match: :first

    click_on "Update User discipline"

    assert_text "User discipline was successfully updated"
    click_on "Back"
  end

  test "destroying a User discipline" do
    visit user_disciplines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User discipline was successfully destroyed"
  end
end
