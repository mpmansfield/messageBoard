require 'test_helper'

class DisciplineRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @discipline_request = discipline_requests(:one)
  end

  test "should get index" do
    get discipline_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_discipline_request_url
    assert_response :success
  end

  test "should create discipline_request" do
    assert_difference('DisciplineRequest.count') do
      post discipline_requests_url, params: { discipline_request: { discipline_id: @discipline_request.discipline_id, user_id: @discipline_request.user_id } }
    end

    assert_redirected_to discipline_request_url(DisciplineRequest.last)
  end

  test "should show discipline_request" do
    get discipline_request_url(@discipline_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_discipline_request_url(@discipline_request)
    assert_response :success
  end

  test "should update discipline_request" do
    patch discipline_request_url(@discipline_request), params: { discipline_request: { discipline_id: @discipline_request.discipline_id, user_id: @discipline_request.user_id } }
    assert_redirected_to discipline_request_url(@discipline_request)
  end

  test "should destroy discipline_request" do
    assert_difference('DisciplineRequest.count', -1) do
      delete discipline_request_url(@discipline_request)
    end

    assert_redirected_to discipline_requests_url
  end
end
