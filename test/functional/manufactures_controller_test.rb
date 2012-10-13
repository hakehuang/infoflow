require 'test_helper'

class ManufacturesControllerTest < ActionController::TestCase
  setup do
    @manufacture = manufactures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:manufactures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create manufacture" do
    assert_difference('Manufacture.count') do
      post :create, manufacture: {  }
    end

    assert_redirected_to manufacture_path(assigns(:manufacture))
  end

  test "should show manufacture" do
    get :show, id: @manufacture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @manufacture
    assert_response :success
  end

  test "should update manufacture" do
    put :update, id: @manufacture, manufacture: {  }
    assert_redirected_to manufacture_path(assigns(:manufacture))
  end

  test "should destroy manufacture" do
    assert_difference('Manufacture.count', -1) do
      delete :destroy, id: @manufacture
    end

    assert_redirected_to manufactures_path
  end
end
