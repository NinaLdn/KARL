require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get page_dashboard_url
    assert_response :success
  end

end
