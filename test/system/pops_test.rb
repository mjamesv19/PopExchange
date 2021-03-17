require "application_system_test_case"

class PopsTest < ApplicationSystemTestCase
  setup do
    @pop = pops(:one)
  end

  test "visiting the index" do
    visit pops_url
    assert_selector "h1", text: "Pops"
  end

  test "creating a Pop" do
    visit pops_url
    click_on "New Pop"

    fill_in "Category", with: @pop.category
    fill_in "Description", with: @pop.description
    fill_in "Name", with: @pop.name
    fill_in "Price", with: @pop.price
    fill_in "User", with: @pop.user_id
    click_on "Create Pop"

    assert_text "Pop was successfully created"
    click_on "Back"
  end

  test "updating a Pop" do
    visit pops_url
    click_on "Edit", match: :first

    fill_in "Category", with: @pop.category
    fill_in "Description", with: @pop.description
    fill_in "Name", with: @pop.name
    fill_in "Price", with: @pop.price
    fill_in "User", with: @pop.user_id
    click_on "Update Pop"

    assert_text "Pop was successfully updated"
    click_on "Back"
  end

  test "destroying a Pop" do
    visit pops_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Pop was successfully destroyed"
  end
end
