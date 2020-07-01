require "application_system_test_case"

class DisciplineRequestsTest < ApplicationSystemTestCase
  setup do
    @discipline_request = discipline_requests(:one)
  end

  test "visiting the index" do
    visit discipline_requests_url
    assert_selector "h1", text: "Discipline Requests"
  end

  test "creating a Discipline request" do
    visit discipline_requests_url
    click_on "New Discipline Request"

    fill_in "Discipline", with: @discipline_request.discipline_id
    fill_in "User", with: @discipline_request.user_id
    click_on "Create Discipline request"

    assert_text "Discipline request was successfully created"
    click_on "Back"
  end

  test "updating a Discipline request" do
    visit discipline_requests_url
    click_on "Edit", match: :first

    fill_in "Discipline", with: @discipline_request.discipline_id
    fill_in "User", with: @discipline_request.user_id
    click_on "Update Discipline request"

    assert_text "Discipline request was successfully updated"
    click_on "Back"
  end

  test "destroying a Discipline request" do
    visit discipline_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Discipline request was successfully destroyed"
  end
end
