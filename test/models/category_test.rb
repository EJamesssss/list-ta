require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  test "shoud not save if existing name on same user" do
    category = Category.new(category_title: "Test", user_id:1)
    assert category.save
    category = Category.new(category_title: "Test", user_id:1)
    assert_not category.save
  end

  
end
