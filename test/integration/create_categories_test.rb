require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "Samer", email: "survivor_512@hotmail.com", password: "asdf", admin: true)
  end

  test "get new caategory form and create category" do
    sign_in_as(@user, "asdf")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
    post categories_path, params: { category: { name: "sports" } }
    follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "sports", response.body
  end

  test "invalid category" do
    sign_in_as(@user, "asdf")
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
    post categories_path, params: { category: { name: " " } }
    end
    assert_template 'categories/new'
    assert_select 'div.card-text.text-danger'
  end

end
