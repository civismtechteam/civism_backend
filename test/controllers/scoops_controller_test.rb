require 'test_helper'

class ScoopsControllerTest < ActionDispatch::IntegrationTest
  test "should get perspectives" do
    get scoops_perspectives_url
    assert_response :success
  end

  test "should get facts" do
    get scoops_facts_url
    assert_response :success
  end

  test "should get show" do
    get scoops_show_url
    assert_response :success
  end

end
