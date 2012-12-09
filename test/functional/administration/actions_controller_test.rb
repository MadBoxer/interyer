require 'test_helper'

class Administration::ActionsControllerTest < ActionController::TestCase
  setup do
    @administration_action = administration_actions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_actions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_action" do
    assert_difference('Administration::Action.count') do
      post :create, administration_action: @administration_action.attributes
    end

    assert_redirected_to administration_action_path(assigns(:administration_action))
  end

  test "should show administration_action" do
    get :show, id: @administration_action
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_action
    assert_response :success
  end

  test "should update administration_action" do
    put :update, id: @administration_action, administration_action: @administration_action.attributes
    assert_redirected_to administration_action_path(assigns(:administration_action))
  end

  test "should destroy administration_action" do
    assert_difference('Administration::Action.count', -1) do
      delete :destroy, id: @administration_action
    end

    assert_redirected_to administration_actions_path
  end
end
