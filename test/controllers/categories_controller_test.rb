require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "sports")
    @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)
  end

  test "should get categories index" do
    assert_generates "/categories", controller: "categories", action: "index"
  end

  test "should get new" do
    sign_in_as(@user, "password")
    assert_generates "/categories/new", controller: "categories", action: "new"
  end

  test "should get show" do
    assert_generates "/categories/1", { controller: "categories", action: "show", id: @category.id }
  end

  test "should redirect create when admin not logged in" do
    assert_no_difference 'Category.count' do
      post categories_path, params: {category: {name: "sports"}}
    end
    assert_redirected_to categories_path
  end
end
