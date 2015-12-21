require 'test_helper'

class WorktimeBroadcastingsControllerTest < ActionController::TestCase
  setup do
    @worktime_broadcasting = worktime_broadcastings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:worktime_broadcastings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create worktime_broadcasting" do
    assert_difference('WorktimeBroadcasting.count') do
      post :create, worktime_broadcasting: { market_id: @worktime_broadcasting.market_id, start: @worktime_broadcasting.start, stop: @worktime_broadcasting.stop, wday: @worktime_broadcasting.wday }
    end

    assert_redirected_to worktime_broadcasting_path(assigns(:worktime_broadcasting))
  end

  test "should show worktime_broadcasting" do
    get :show, id: @worktime_broadcasting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @worktime_broadcasting
    assert_response :success
  end

  test "should update worktime_broadcasting" do
    patch :update, id: @worktime_broadcasting, worktime_broadcasting: { market_id: @worktime_broadcasting.market_id, start: @worktime_broadcasting.start, stop: @worktime_broadcasting.stop, wday: @worktime_broadcasting.wday }
    assert_redirected_to worktime_broadcasting_path(assigns(:worktime_broadcasting))
  end

  test "should destroy worktime_broadcasting" do
    assert_difference('WorktimeBroadcasting.count', -1) do
      delete :destroy, id: @worktime_broadcasting
    end

    assert_redirected_to worktime_broadcastings_path
  end
end
