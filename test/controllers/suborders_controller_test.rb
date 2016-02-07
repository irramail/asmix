require 'test_helper'

class SubordersControllerTest < ActionController::TestCase
  setup do
    @suborder = suborders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:suborders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suborder" do
    assert_difference('Suborder.count') do
      post :create, suborder: { device_id: @suborder.device_id, order_id: @suborder.order_id, period_id: @suborder.period_id, startdt: @suborder.startdt, startt: @suborder.startt, stopdt: @suborder.stopdt, stopt: @suborder.stopt }
    end

    assert_redirected_to suborder_path(assigns(:suborder))
  end

  test "should show suborder" do
    get :show, id: @suborder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @suborder
    assert_response :success
  end

  test "should update suborder" do
    patch :update, id: @suborder, suborder: { device_id: @suborder.device_id, order_id: @suborder.order_id, period_id: @suborder.period_id, startdt: @suborder.startdt, startt: @suborder.startt, stopdt: @suborder.stopdt, stopt: @suborder.stopt }
    assert_redirected_to suborder_path(assigns(:suborder))
  end

  test "should destroy suborder" do
    assert_difference('Suborder.count', -1) do
      delete :destroy, id: @suborder
    end

    assert_redirected_to suborders_path
  end
end
