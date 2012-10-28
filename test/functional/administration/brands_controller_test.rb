require 'test_helper'

class Administration::BrandsControllerTest < ActionController::TestCase
  setup do
    @administration_brand = administration_brands(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_brands)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_brand" do
    assert_difference('Administration::Brand.count') do
      post :create, administration_brand: @administration_brand.attributes
    end

    assert_redirected_to administration_brand_path(assigns(:administration_brand))
  end

  test "should show administration_brand" do
    get :show, id: @administration_brand
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_brand
    assert_response :success
  end

  test "should update administration_brand" do
    put :update, id: @administration_brand, administration_brand: @administration_brand.attributes
    assert_redirected_to administration_brand_path(assigns(:administration_brand))
  end

  test "should destroy administration_brand" do
    assert_difference('Administration::Brand.count', -1) do
      delete :destroy, id: @administration_brand
    end

    assert_redirected_to administration_brands_path
  end
end
