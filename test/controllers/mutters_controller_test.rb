require 'test_helper'

class MuttersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mutters_index_url
    assert_response :success
  end

end
