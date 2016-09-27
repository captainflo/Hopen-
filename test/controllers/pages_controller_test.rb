require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get mention" do
    get pages_mention_url
    assert_response :success
  end

end
