require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @category = Category.create(name: "sports")
  end

  test "should get categories index" do
    assert_generates "/categories", controller: "categories", action: "index"
  end

  test "should get new" do
    assert_generates "/categories/new", controller: "categories", action: "new"
  end

  test "should get show" do
    assert_generates "/categories/1", { controller: "categories", action: "show", id: @category.id }
  end
end
