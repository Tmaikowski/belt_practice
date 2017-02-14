require 'test_helper'

class PatronsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get patrons_create_url
    assert_response :success
  end

  test "should get destroy" do
    get patrons_destroy_url
    assert_response :success
  end

end
