require "application_system_test_case"

class CoordinatorRegistriesTest < ApplicationSystemTestCase
  setup do
    @coordinator_registry = coordinator_registries(:one)
  end

  test "visiting the index" do
    visit coordinator_registries_url
    assert_selector "h1", text: "Coordinator Registries"
  end

  test "creating a Coordinator registry" do
    visit coordinator_registries_url
    click_on "New Coordinator Registry"

    click_on "Create Coordinator registry"

    assert_text "Coordinator registry was successfully created"
    click_on "Back"
  end

  test "updating a Coordinator registry" do
    visit coordinator_registries_url
    click_on "Edit", match: :first

    click_on "Update Coordinator registry"

    assert_text "Coordinator registry was successfully updated"
    click_on "Back"
  end

  test "destroying a Coordinator registry" do
    visit coordinator_registries_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Coordinator registry was successfully destroyed"
  end
end
