require 'test_helper'

class LaptimesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get laptimes_index_url
    assert_response :success
  end

end
