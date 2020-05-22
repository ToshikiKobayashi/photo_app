require 'test_helper'

class OauthControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get oauth_get_url
    assert_response :success
  end

end
