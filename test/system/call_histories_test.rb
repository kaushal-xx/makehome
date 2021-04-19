require "application_system_test_case"

class CallHistoriesTest < ApplicationSystemTestCase
  setup do
    @call_history = call_histories(:one)
  end

  test "visiting the index" do
    visit call_histories_url
    assert_selector "h1", text: "Call Histories"
  end

  test "creating a Call history" do
    visit call_histories_url
    click_on "New Call History"

    fill_in "Caller mobile", with: @call_history.caller_mobile
    fill_in "Caller name", with: @call_history.caller_name
    fill_in "Date", with: @call_history.date
    fill_in "User mobile", with: @call_history.user_mobile
    fill_in "Username", with: @call_history.username
    click_on "Create Call history"

    assert_text "Call history was successfully created"
    click_on "Back"
  end

  test "updating a Call history" do
    visit call_histories_url
    click_on "Edit", match: :first

    fill_in "Caller mobile", with: @call_history.caller_mobile
    fill_in "Caller name", with: @call_history.caller_name
    fill_in "Date", with: @call_history.date
    fill_in "User mobile", with: @call_history.user_mobile
    fill_in "Username", with: @call_history.username
    click_on "Update Call history"

    assert_text "Call history was successfully updated"
    click_on "Back"
  end

  test "destroying a Call history" do
    visit call_histories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Call history was successfully destroyed"
  end
end
