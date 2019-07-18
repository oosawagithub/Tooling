require 'test_helper'

class Admins::CategoryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_category_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_category_create_url
    assert_response :success
  end

end
