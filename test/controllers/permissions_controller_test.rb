require 'test_helper'

class PermissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get permissions_index_url
    assert_response :success
  end

  test "should get new" do
    get permissions_new_url
    assert_response :success
  end

  test "should get edit" do
    get permissions_edit_url
    assert_response :success
  end

end
