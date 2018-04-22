require 'test_helper'

class ChamadasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chamadas_index_url
    assert_response :success
  end

end
