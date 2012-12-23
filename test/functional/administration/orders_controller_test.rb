require 'test_helper'

class Administration::OrdersControllerTest < ActionController::TestCase
  setup do
    @administration_order = administration_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_order" do
    assert_difference('Administration::Order.count') do
      post :create, administration_order: @administration_order.attributes
    end

    assert_redirected_to administration_order_path(assigns(:administration_order))
  end

  test "should show administration_order" do
    get :show, id: @administration_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_order
    assert_response :success
  end

  test "should update administration_order" do
    put :update, id: @administration_order, administration_order: @administration_order.attributes
    assert_redirected_to administration_order_path(assigns(:administration_order))
  end

  test "should destroy administration_order" do
    assert_difference('Administration::Order.count', -1) do
      delete :destroy, id: @administration_order
    end

    assert_redirected_to administration_orders_path
  end
end
