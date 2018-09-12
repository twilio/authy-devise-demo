require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "the index loads" do
    get root_url

    assert_response :success
    assert_equal "index", @controller.action_name
  end
end
