require 'test_helper'

class Administration::DiscountsControllerTest < ActionController::TestCase
  setup do
    @administration_discount = administration_discounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_discounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_discount" do
    assert_difference('Administration::Discount.count') do
      post :create, administration_discount: @administration_discount.attributes
    end

    assert_redirected_to administration_discount_path(assigns(:administration_discount))
  end

  test "should show administration_discount" do
    get :show, id: @administration_discount
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_discount
    assert_response :success
  end

  test "should update administration_discount" do
    put :update, id: @administration_discount, administration_discount: @administration_discount.attributes
    assert_redirected_to administration_discount_path(assigns(:administration_discount))
  end

  test "should destroy administration_discount" do
    assert_difference('Administration::Discount.count', -1) do
      delete :destroy, id: @administration_discount
    end

    assert_redirected_to administration_discounts_path
  end
end
