require 'test_helper'

class PlsbgmusicDevicesControllerTest < ActionController::TestCase
  setup do
    @plsbgmusic_device = plsbgmusic_devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plsbgmusic_devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plsbgmusic_device" do
    assert_difference('PlsbgmusicDevice.count') do
      post :create, plsbgmusic_device: { device_id: @plsbgmusic_device.device_id, plsbgmusic_id: @plsbgmusic_device.plsbgmusic_id }
    end

    assert_redirected_to plsbgmusic_device_path(assigns(:plsbgmusic_device))
  end

  test "should show plsbgmusic_device" do
    get :show, id: @plsbgmusic_device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plsbgmusic_device
    assert_response :success
  end

  test "should update plsbgmusic_device" do
    patch :update, id: @plsbgmusic_device, plsbgmusic_device: { device_id: @plsbgmusic_device.device_id, plsbgmusic_id: @plsbgmusic_device.plsbgmusic_id }
    assert_redirected_to plsbgmusic_device_path(assigns(:plsbgmusic_device))
  end

  test "should destroy plsbgmusic_device" do
    assert_difference('PlsbgmusicDevice.count', -1) do
      delete :destroy, id: @plsbgmusic_device
    end

    assert_redirected_to plsbgmusic_devices_path
  end
end
