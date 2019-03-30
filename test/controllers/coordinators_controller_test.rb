require 'test_helper'

class CoordinatorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get coordinators_index_url
    assert_response :success
  end

  test "should get show" do
    get coordinators_show_url
    assert_response :success
  end

  test "should get new" do
    get coordinators_new_url
    assert_response :success
  end

  test "should get edit" do
    get coordinators_edit_url
    assert_response :success
  end

end
