require 'test_helper'

class Administration::ProductsControllerTest < ActionController::TestCase
  setup do
    @administration_product = administration_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_product" do
    assert_difference('Administration::Product.count') do
      post :create, administration_product: @administration_product.attributes
    end

    assert_redirected_to administration_product_path(assigns(:administration_product))
  end

  test "should show administration_product" do
    get :show, id: @administration_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_product
    assert_response :success
  end

  test "should update administration_product" do
    put :update, id: @administration_product, administration_product: @administration_product.attributes
    assert_redirected_to administration_product_path(assigns(:administration_product))
  end

  test "should destroy administration_product" do
    assert_difference('Administration::Product.count', -1) do
      delete :destroy, id: @administration_product
    end

    assert_redirected_to administration_products_path
  end
end
