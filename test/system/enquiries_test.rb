require "application_system_test_case"

class EnquiriesTest < ApplicationSystemTestCase
  setup do
    @enquiry = enquiries(:one)
  end

  test "visiting the index" do
    visit enquiries_url
    assert_selector "h1", text: "Enquiries"
  end

  test "creating a Enquiry" do
    visit enquiries_url
    click_on "New Enquiry"

    fill_in "Email", with: @enquiry.email
    fill_in "Message", with: @enquiry.message
    fill_in "Mobile", with: @enquiry.mobile
    fill_in "Name", with: @enquiry.name
    click_on "Create Enquiry"

    assert_text "Enquiry was successfully created"
    click_on "Back"
  end

  test "updating a Enquiry" do
    visit enquiries_url
    click_on "Edit", match: :first

    fill_in "Email", with: @enquiry.email
    fill_in "Message", with: @enquiry.message
    fill_in "Mobile", with: @enquiry.mobile
    fill_in "Name", with: @enquiry.name
    click_on "Update Enquiry"

    assert_text "Enquiry was successfully updated"
    click_on "Back"
  end

  test "destroying a Enquiry" do
    visit enquiries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Enquiry was successfully destroyed"
  end
end
