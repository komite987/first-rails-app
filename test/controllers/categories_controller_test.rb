require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "Samer", email: "survivor_512@hotmail.com", password: "asdf", admin: true)
  end

  test "should get new" do
    sign_in_as(@user, "asdf")
    get new_category_url
    assert_response :success
  end

  test "should get show" do
    get category_url(@category)
    assert_response :success
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should redirected create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params:{category:{name: "sports"}}
    end
    assert_redirected_to categories_path
  end

end
