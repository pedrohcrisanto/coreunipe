require 'test_helper'

class MilitariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @military = militaries(:one)
  end

  test "should get index" do
    get militaries_url
    assert_response :success
  end

  test "should get new" do
    get new_military_url
    assert_response :success
  end

  test "should create military" do
    assert_difference('Military.count') do
      post militaries_url, params: { military: { admission_date: @military.admission_date, beret_size: @military.beret_size, boot_size: @military.boot_size, name: @military.name, pants_size: @military.pants_size, rank: @military.rank, registration: @military.registration, t_shirt_size: @military.t_shirt_size, user_id: @military.user_id } }
    end

    assert_redirected_to military_url(Military.last)
  end

  test "should show military" do
    get military_url(@military)
    assert_response :success
  end

  test "should get edit" do
    get edit_military_url(@military)
    assert_response :success
  end

  test "should update military" do
    patch military_url(@military), params: { military: { admission_date: @military.admission_date, beret_size: @military.beret_size, boot_size: @military.boot_size, name: @military.name, pants_size: @military.pants_size, rank: @military.rank, registration: @military.registration, t_shirt_size: @military.t_shirt_size, user_id: @military.user_id } }
    assert_redirected_to military_url(@military)
  end

  test "should destroy military" do
    assert_difference('Military.count', -1) do
      delete military_url(@military)
    end

    assert_redirected_to militaries_url
  end
end
