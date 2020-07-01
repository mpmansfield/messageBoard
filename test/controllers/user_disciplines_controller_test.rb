require 'test_helper'

class UserDisciplinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_discipline = user_disciplines(:one)
  end

  test "should get index" do
    get user_disciplines_url
    assert_response :success
  end

  test "should get new" do
    get new_user_discipline_url
    assert_response :success
  end

  test "should create user_discipline" do
    assert_difference('UserDiscipline.count') do
      post user_disciplines_url, params: { user_discipline: {  } }
    end

    assert_redirected_to user_discipline_url(UserDiscipline.last)
  end

  test "should show user_discipline" do
    get user_discipline_url(@user_discipline)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_discipline_url(@user_discipline)
    assert_response :success
  end

  test "should update user_discipline" do
    patch user_discipline_url(@user_discipline), params: { user_discipline: {  } }
    assert_redirected_to user_discipline_url(@user_discipline)
  end

  test "should destroy user_discipline" do
    assert_difference('UserDiscipline.count', -1) do
      delete user_discipline_url(@user_discipline)
    end

    assert_redirected_to user_disciplines_url
  end
end
