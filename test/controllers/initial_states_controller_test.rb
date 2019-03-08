require 'test_helper'

class InitialStatesControllerTest < ActionDispatch::IntegrationTest
  test "should get scoops_show" do
    get initial_states_scoops_show_url
    assert_response :success
  end

end
