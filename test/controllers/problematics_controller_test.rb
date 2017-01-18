require 'test_helper'

class ProblematicsControllerTest < ActionController::TestCase
  setup do
    @problematic = problematics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:problematics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create problematic" do
    assert_difference('Problematic.count') do
      post :create, problematic: {  }
    end

    assert_redirected_to problematic_path(assigns(:problematic))
  end

  test "should show problematic" do
    get :show, id: @problematic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @problematic
    assert_response :success
  end

  test "should update problematic" do
    patch :update, id: @problematic, problematic: {  }
    assert_redirected_to problematic_path(assigns(:problematic))
  end

  test "should destroy problematic" do
    assert_difference('Problematic.count', -1) do
      delete :destroy, id: @problematic
    end

    assert_redirected_to problematics_path
  end
end
