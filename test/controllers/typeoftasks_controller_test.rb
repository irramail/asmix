require 'test_helper'

class TypeoftasksControllerTest < ActionController::TestCase
  setup do
    @typeoftask = typeoftasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:typeoftasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create typeoftask" do
    assert_difference('Typeoftask.count') do
      post :create, typeoftask: { name: @typeoftask.name, priority: @typeoftask.priority }
    end

    assert_redirected_to typeoftask_path(assigns(:typeoftask))
  end

  test "should show typeoftask" do
    get :show, id: @typeoftask
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @typeoftask
    assert_response :success
  end

  test "should update typeoftask" do
    patch :update, id: @typeoftask, typeoftask: { name: @typeoftask.name, priority: @typeoftask.priority }
    assert_redirected_to typeoftask_path(assigns(:typeoftask))
  end

  test "should destroy typeoftask" do
    assert_difference('Typeoftask.count', -1) do
      delete :destroy, id: @typeoftask
    end

    assert_redirected_to typeoftasks_path
  end
end
