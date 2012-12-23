require 'test_helper'

class Public::UsersControllerTest < ActionController::TestCase
  setup do
    @public_user = public_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:public_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create public_user" do
    assert_difference('Public::User.count') do
      post :create, public_user: @public_user.attributes
    end

    assert_redirected_to public_user_path(assigns(:public_user))
  end

  test "should show public_user" do
    get :show, id: @public_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @public_user
    assert_response :success
  end

  test "should update public_user" do
    put :update, id: @public_user, public_user: @public_user.attributes
    assert_redirected_to public_user_path(assigns(:public_user))
  end

  test "should destroy public_user" do
    assert_difference('Public::User.count', -1) do
      delete :destroy, id: @public_user
    end

    assert_redirected_to public_users_path
  end
end
