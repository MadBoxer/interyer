require 'test_helper'

class Public::OrdersControllerTest < ActionController::TestCase
  setup do
    @public_order = public_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:public_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create public_order" do
    assert_difference('Public::Order.count') do
      post :create, public_order: @public_order.attributes
    end

    assert_redirected_to public_order_path(assigns(:public_order))
  end

  test "should show public_order" do
    get :show, id: @public_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @public_order
    assert_response :success
  end

  test "should update public_order" do
    put :update, id: @public_order, public_order: @public_order.attributes
    assert_redirected_to public_order_path(assigns(:public_order))
  end

  test "should destroy public_order" do
    assert_difference('Public::Order.count', -1) do
      delete :destroy, id: @public_order
    end

    assert_redirected_to public_orders_path
  end
end
