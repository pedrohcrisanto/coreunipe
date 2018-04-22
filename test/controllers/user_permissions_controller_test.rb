require 'test_helper'

class UserPermissionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_permissions_index_url
    assert_response :success
  end

  test "should get edit" do
    get user_permissions_edit_url
    assert_response :success
  end

  test "should get show" do
    get user_permissions_show_url
    assert_response :success
  end

end
