require 'test_helper'

class Administration::CategoriesControllerTest < ActionController::TestCase
  setup do
    @administration_category = administration_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_category" do
    assert_difference('Administration::Category.count') do
      post :create, administration_category: @administration_category.attributes
    end

    assert_redirected_to administration_category_path(assigns(:administration_category))
  end

  test "should show administration_category" do
    get :show, id: @administration_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_category
    assert_response :success
  end

  test "should update administration_category" do
    put :update, id: @administration_category, administration_category: @administration_category.attributes
    assert_redirected_to administration_category_path(assigns(:administration_category))
  end

  test "should destroy administration_category" do
    assert_difference('Administration::Category.count', -1) do
      delete :destroy, id: @administration_category
    end

    assert_redirected_to administration_categories_path
  end
end
