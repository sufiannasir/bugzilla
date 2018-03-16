require 'test_helper'

class ProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get project_create_url
    assert_response :success
  end

  test "should get update" do
    get project_update_url
    assert_response :success
  end

  test "should get delete" do
    get project_delete_url
    assert_response :success
  end

  test "should get list" do
    get project_list_url
    assert_response :success
  end

end
