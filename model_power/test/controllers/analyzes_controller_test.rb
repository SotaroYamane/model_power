require 'test_helper'

class AnalyzesControllerTest < ActionController::TestCase
  setup do
    @analyze = analyzes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:analyzes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create analyze" do
    assert_difference('Analyze.count') do
      post :create, analyze: {  }
    end

    assert_redirected_to analyze_path(assigns(:analyze))
  end

  test "should show analyze" do
    get :show, id: @analyze
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @analyze
    assert_response :success
  end

  test "should update analyze" do
    patch :update, id: @analyze, analyze: {  }
    assert_redirected_to analyze_path(assigns(:analyze))
  end

  test "should destroy analyze" do
    assert_difference('Analyze.count', -1) do
      delete :destroy, id: @analyze
    end

    assert_redirected_to analyzes_path
  end
end
