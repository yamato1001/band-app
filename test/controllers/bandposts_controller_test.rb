require 'test_helper'

class BandpostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bandposts_index_url
    assert_response :success
  end

end
