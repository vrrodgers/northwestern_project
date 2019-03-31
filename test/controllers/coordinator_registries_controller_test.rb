require 'test_helper'

class CoordinatorRegistriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @coordinator_registry = coordinator_registries(:one)
  end

  test "should get index" do
    get coordinator_registries_url
    assert_response :success
  end

  test "should get new" do
    get new_coordinator_registry_url
    assert_response :success
  end

  test "should create coordinator_registry" do
    assert_difference('CoordinatorRegistry.count') do
      post coordinator_registries_url, params: { coordinator_registry: {  } }
    end

    assert_redirected_to coordinator_registry_url(CoordinatorRegistry.last)
  end

  test "should show coordinator_registry" do
    get coordinator_registry_url(@coordinator_registry)
    assert_response :success
  end

  test "should get edit" do
    get edit_coordinator_registry_url(@coordinator_registry)
    assert_response :success
  end

  test "should update coordinator_registry" do
    patch coordinator_registry_url(@coordinator_registry), params: { coordinator_registry: {  } }
    assert_redirected_to coordinator_registry_url(@coordinator_registry)
  end

  test "should destroy coordinator_registry" do
    assert_difference('CoordinatorRegistry.count', -1) do
      delete coordinator_registry_url(@coordinator_registry)
    end

    assert_redirected_to coordinator_registries_url
  end
end
