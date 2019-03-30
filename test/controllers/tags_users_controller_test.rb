require 'test_helper'

class TagsUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get insert" do
    get tags_users_insert_url
    assert_response :success
  end

  test "should get delete" do
    get tags_users_delete_url
    assert_response :success
  end

end
