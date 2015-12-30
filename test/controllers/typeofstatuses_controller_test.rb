require 'test_helper'

class TypeofstatusesControllerTest < ActionController::TestCase
  setup do
    @typeofstatus = typeofstatuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:typeofstatuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create typeofstatus" do
    assert_difference('Typeofstatus.count') do
      post :create, typeofstatus: { name: @typeofstatus.name, priority: @typeofstatus.priority }
    end

    assert_redirected_to typeofstatus_path(assigns(:typeofstatus))
  end

  test "should show typeofstatus" do
    get :show, id: @typeofstatus
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @typeofstatus
    assert_response :success
  end

  test "should update typeofstatus" do
    patch :update, id: @typeofstatus, typeofstatus: { name: @typeofstatus.name, priority: @typeofstatus.priority }
    assert_redirected_to typeofstatus_path(assigns(:typeofstatus))
  end

  test "should destroy typeofstatus" do
    assert_difference('Typeofstatus.count', -1) do
      delete :destroy, id: @typeofstatus
    end

    assert_redirected_to typeofstatuses_path
  end
end
