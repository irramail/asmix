require 'test_helper'

class VolsofdaysControllerTest < ActionController::TestCase
  setup do
    @volsofday = volsofdays(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volsofdays)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volsofday" do
    assert_difference('Volsofday.count') do
      post :create, volsofday: { market_id: @volsofday.market_id, name: @volsofday.name, time: @volsofday.time, value: @volsofday.value }
    end

    assert_redirected_to volsofday_path(assigns(:volsofday))
  end

  test "should show volsofday" do
    get :show, id: @volsofday
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volsofday
    assert_response :success
  end

  test "should update volsofday" do
    patch :update, id: @volsofday, volsofday: { market_id: @volsofday.market_id, name: @volsofday.name, time: @volsofday.time, value: @volsofday.value }
    assert_redirected_to volsofday_path(assigns(:volsofday))
  end

  test "should destroy volsofday" do
    assert_difference('Volsofday.count', -1) do
      delete :destroy, id: @volsofday
    end

    assert_redirected_to volsofdays_path
  end
end
