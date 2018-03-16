require 'test_helper'

class BugsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get bugs_list_url
    assert_response :success
  end

  test "should get create" do
    get bugs_create_url
    assert_response :success
  end

  test "should get delete" do
    get bugs_delete_url
    assert_response :success
  end

  test "should get update" do
    get bugs_update_url
    assert_response :success
  end

end
