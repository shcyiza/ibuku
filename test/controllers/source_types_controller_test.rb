require 'test_helper'

class SourceTypesControllerTest < ActionController::TestCase
  setup do
    @source_type = source_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:source_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create source_type" do
    assert_difference('SourceType.count') do
      post :create, source_type: { name: @source_type.name }
    end

    assert_redirected_to source_type_path(assigns(:source_type))
  end

  test "should show source_type" do
    get :show, id: @source_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @source_type
    assert_response :success
  end

  test "should update source_type" do
    patch :update, id: @source_type, source_type: { name: @source_type.name }
    assert_redirected_to source_type_path(assigns(:source_type))
  end

  test "should destroy source_type" do
    assert_difference('SourceType.count', -1) do
      delete :destroy, id: @source_type
    end

    assert_redirected_to source_types_path
  end
end
