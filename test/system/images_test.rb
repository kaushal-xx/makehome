require "application_system_test_case"

class ImagesTest < ApplicationSystemTestCase
  setup do
    @image = images(:one)
  end

  test "visiting the index" do
    visit images_url
    assert_selector "h1", text: "Images"
  end

  test "creating a Image" do
    visit images_url
    click_on "New Image"

    fill_in "Image type", with: @image.image_type
    fill_in "Image url", with: @image.image_url
    fill_in "Name", with: @image.name
    fill_in "References", with: @image.references
    check "Visibility" if @image.visibility
    click_on "Create Image"

    assert_text "Image was successfully created"
    click_on "Back"
  end

  test "updating a Image" do
    visit images_url
    click_on "Edit", match: :first

    fill_in "Image type", with: @image.image_type
    fill_in "Image url", with: @image.image_url
    fill_in "Name", with: @image.name
    fill_in "References", with: @image.references
    check "Visibility" if @image.visibility
    click_on "Update Image"

    assert_text "Image was successfully updated"
    click_on "Back"
  end

  test "destroying a Image" do
    visit images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Image was successfully destroyed"
  end
end
