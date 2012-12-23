require 'test_helper'

class Administration::SurfacesControllerTest < ActionController::TestCase
  setup do
    @administration_surface = administration_surfaces(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_surfaces)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_surface" do
    assert_difference('Administration::Surface.count') do
      post :create, administration_surface: @administration_surface.attributes
    end

    assert_redirected_to administration_surface_path(assigns(:administration_surface))
  end

  test "should show administration_surface" do
    get :show, id: @administration_surface
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_surface
    assert_response :success
  end

  test "should update administration_surface" do
    put :update, id: @administration_surface, administration_surface: @administration_surface.attributes
    assert_redirected_to administration_surface_path(assigns(:administration_surface))
  end

  test "should destroy administration_surface" do
    assert_difference('Administration::Surface.count', -1) do
      delete :destroy, id: @administration_surface
    end

    assert_redirected_to administration_surfaces_path
  end
end
