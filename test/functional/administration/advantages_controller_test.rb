require 'test_helper'

class Administration::AdvantagesControllerTest < ActionController::TestCase
  setup do
    @administration_advantage = administration_advantages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_advantages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_advantage" do
    assert_difference('Administration::Advantage.count') do
      post :create, administration_advantage: @administration_advantage.attributes
    end

    assert_redirected_to administration_advantage_path(assigns(:administration_advantage))
  end

  test "should show administration_advantage" do
    get :show, id: @administration_advantage
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_advantage
    assert_response :success
  end

  test "should update administration_advantage" do
    put :update, id: @administration_advantage, administration_advantage: @administration_advantage.attributes
    assert_redirected_to administration_advantage_path(assigns(:administration_advantage))
  end

  test "should destroy administration_advantage" do
    assert_difference('Administration::Advantage.count', -1) do
      delete :destroy, id: @administration_advantage
    end

    assert_redirected_to administration_advantages_path
  end
end
