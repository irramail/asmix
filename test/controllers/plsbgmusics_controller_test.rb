require 'test_helper'

class PlsbgmusicsControllerTest < ActionController::TestCase
  setup do
    @plsbgmusic = plsbgmusics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plsbgmusics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plsbgmusic" do
    assert_difference('Plsbgmusic.count') do
      post :create, plsbgmusic: { name: @plsbgmusic.name }
    end

    assert_redirected_to plsbgmusic_path(assigns(:plsbgmusic))
  end

  test "should show plsbgmusic" do
    get :show, id: @plsbgmusic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plsbgmusic
    assert_response :success
  end

  test "should update plsbgmusic" do
    patch :update, id: @plsbgmusic, plsbgmusic: { name: @plsbgmusic.name }
    assert_redirected_to plsbgmusic_path(assigns(:plsbgmusic))
  end

  test "should destroy plsbgmusic" do
    assert_difference('Plsbgmusic.count', -1) do
      delete :destroy, id: @plsbgmusic
    end

    assert_redirected_to plsbgmusics_path
  end
end
