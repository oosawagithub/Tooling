require 'test_helper'

class Admin::CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_category_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_category_create_url
    assert_response :success
  end

end
