require 'test_helper'

class PlsbgimagesControllerTest < ActionController::TestCase
  setup do
    @plsbgimage = plsbgimages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plsbgimages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plsbgimage" do
    assert_difference('Plsbgimage.count') do
      post :create, plsbgimage: { name: @plsbgimage.name }
    end

    assert_redirected_to plsbgimage_path(assigns(:plsbgimage))
  end

  test "should show plsbgimage" do
    get :show, id: @plsbgimage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plsbgimage
    assert_response :success
  end

  test "should update plsbgimage" do
    patch :update, id: @plsbgimage, plsbgimage: { name: @plsbgimage.name }
    assert_redirected_to plsbgimage_path(assigns(:plsbgimage))
  end

  test "should destroy plsbgimage" do
    assert_difference('Plsbgimage.count', -1) do
      delete :destroy, id: @plsbgimage
    end

    assert_redirected_to plsbgimages_path
  end
end
