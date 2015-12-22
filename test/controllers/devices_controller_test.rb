require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  setup do
    @device = devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device" do
    assert_difference('Device.count') do
      post :create, device: { active: @device.active, comment: @device.comment, eq0: @device.eq0, eq1: @device.eq1, eq2: @device.eq2, eq3: @device.eq3, eq4: @device.eq4, eq5: @device.eq5, eq6: @device.eq6, eq7: @device.eq7, eq8: @device.eq8, eq9: @device.eq9, market_id: @device.market_id, name: @device.name, ping: @device.ping, sn: @device.sn, tzdate: @device.tzdate }
    end

    assert_redirected_to device_path(assigns(:device))
  end

  test "should show device" do
    get :show, id: @device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device
    assert_response :success
  end

  test "should update device" do
    patch :update, id: @device, device: { active: @device.active, comment: @device.comment, eq0: @device.eq0, eq1: @device.eq1, eq2: @device.eq2, eq3: @device.eq3, eq4: @device.eq4, eq5: @device.eq5, eq6: @device.eq6, eq7: @device.eq7, eq8: @device.eq8, eq9: @device.eq9, market_id: @device.market_id, name: @device.name, ping: @device.ping, sn: @device.sn, tzdate: @device.tzdate }
    assert_redirected_to device_path(assigns(:device))
  end

  test "should destroy device" do
    assert_difference('Device.count', -1) do
      delete :destroy, id: @device
    end

    assert_redirected_to devices_path
  end
end
