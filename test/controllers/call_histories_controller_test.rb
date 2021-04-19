require 'test_helper'

class CallHistoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @call_history = call_histories(:one)
  end

  test "should get index" do
    get call_histories_url
    assert_response :success
  end

  test "should get new" do
    get new_call_history_url
    assert_response :success
  end

  test "should create call_history" do
    assert_difference('CallHistory.count') do
      post call_histories_url, params: { call_history: { caller_mobile: @call_history.caller_mobile, caller_name: @call_history.caller_name, date: @call_history.date, user_mobile: @call_history.user_mobile, username: @call_history.username } }
    end

    assert_redirected_to call_history_url(CallHistory.last)
  end

  test "should show call_history" do
    get call_history_url(@call_history)
    assert_response :success
  end

  test "should get edit" do
    get edit_call_history_url(@call_history)
    assert_response :success
  end

  test "should update call_history" do
    patch call_history_url(@call_history), params: { call_history: { caller_mobile: @call_history.caller_mobile, caller_name: @call_history.caller_name, date: @call_history.date, user_mobile: @call_history.user_mobile, username: @call_history.username } }
    assert_redirected_to call_history_url(@call_history)
  end

  test "should destroy call_history" do
    assert_difference('CallHistory.count', -1) do
      delete call_history_url(@call_history)
    end

    assert_redirected_to call_histories_url
  end
end
