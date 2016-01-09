require 'test_helper'

class PlsbgvideosControllerTest < ActionController::TestCase
  setup do
    @plsbgvideo = plsbgvideos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plsbgvideos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plsbgvideo" do
    assert_difference('Plsbgvideo.count') do
      post :create, plsbgvideo: { name: @plsbgvideo.name }
    end

    assert_redirected_to plsbgvideo_path(assigns(:plsbgvideo))
  end

  test "should show plsbgvideo" do
    get :show, id: @plsbgvideo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plsbgvideo
    assert_response :success
  end

  test "should update plsbgvideo" do
    patch :update, id: @plsbgvideo, plsbgvideo: { name: @plsbgvideo.name }
    assert_redirected_to plsbgvideo_path(assigns(:plsbgvideo))
  end

  test "should destroy plsbgvideo" do
    assert_difference('Plsbgvideo.count', -1) do
      delete :destroy, id: @plsbgvideo
    end

    assert_redirected_to plsbgvideos_path
  end
end
