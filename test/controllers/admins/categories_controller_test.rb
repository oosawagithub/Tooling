require 'test_helper'

class Admins::CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_categories_new_url
    assert_response :success
  end

  test "should get create" do
    get admins_categories_create_url
    assert_response :success
  end

end
