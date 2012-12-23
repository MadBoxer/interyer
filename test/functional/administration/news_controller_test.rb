require 'test_helper'

class Administration::NewsControllerTest < ActionController::TestCase
  setup do
    @administration_news = administration_news(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administration_news)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administration_news" do
    assert_difference('Administration::News.count') do
      post :create, administration_news: @administration_news.attributes
    end

    assert_redirected_to administration_news_path(assigns(:administration_news))
  end

  test "should show administration_news" do
    get :show, id: @administration_news
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administration_news
    assert_response :success
  end

  test "should update administration_news" do
    put :update, id: @administration_news, administration_news: @administration_news.attributes
    assert_redirected_to administration_news_path(assigns(:administration_news))
  end

  test "should destroy administration_news" do
    assert_difference('Administration::News.count', -1) do
      delete :destroy, id: @administration_news
    end

    assert_redirected_to administration_news_index_path
  end
end
