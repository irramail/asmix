require 'test_helper'

class PlistsControllerTest < ActionController::TestCase
  setup do
    @plist = plists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plist" do
    assert_difference('Plist.count') do
      post :create, plist: { mediafile_id: @plist.mediafile_id, suborder_id: @plist.suborder_id }
    end

    assert_redirected_to plist_path(assigns(:plist))
  end

  test "should show plist" do
    get :show, id: @plist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plist
    assert_response :success
  end

  test "should update plist" do
    patch :update, id: @plist, plist: { mediafile_id: @plist.mediafile_id, suborder_id: @plist.suborder_id }
    assert_redirected_to plist_path(assigns(:plist))
  end

  test "should destroy plist" do
    assert_difference('Plist.count', -1) do
      delete :destroy, id: @plist
    end

    assert_redirected_to plists_path
  end
end
