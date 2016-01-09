require 'test_helper'

class PlsbgmusicMediafilesControllerTest < ActionController::TestCase
  setup do
    @plsbgmusic_mediafile = plsbgmusic_mediafiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plsbgmusic_mediafiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plsbgmusic_mediafile" do
    assert_difference('PlsbgmusicMediafile.count') do
      post :create, plsbgmusic_mediafile: { mediafile_id: @plsbgmusic_mediafile.mediafile_id, plsbgmusic_id: @plsbgmusic_mediafile.plsbgmusic_id }
    end

    assert_redirected_to plsbgmusic_mediafile_path(assigns(:plsbgmusic_mediafile))
  end

  test "should show plsbgmusic_mediafile" do
    get :show, id: @plsbgmusic_mediafile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plsbgmusic_mediafile
    assert_response :success
  end

  test "should update plsbgmusic_mediafile" do
    patch :update, id: @plsbgmusic_mediafile, plsbgmusic_mediafile: { mediafile_id: @plsbgmusic_mediafile.mediafile_id, plsbgmusic_id: @plsbgmusic_mediafile.plsbgmusic_id }
    assert_redirected_to plsbgmusic_mediafile_path(assigns(:plsbgmusic_mediafile))
  end

  test "should destroy plsbgmusic_mediafile" do
    assert_difference('PlsbgmusicMediafile.count', -1) do
      delete :destroy, id: @plsbgmusic_mediafile
    end

    assert_redirected_to plsbgmusic_mediafiles_path
  end
end
