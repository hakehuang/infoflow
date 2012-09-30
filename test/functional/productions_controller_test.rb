require 'test_helper'

class ProductionsControllerTest < ActionController::TestCase
  setup do
    @production = productions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:productions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create production" do
    assert_difference('Production.count') do
      post :create, production: { QC_final: @production.QC_final, QC_in_production: @production.QC_in_production, customer_approval_counter_sample: @production.customer_approval_counter_sample, factory_counter_sample: @production.factory_counter_sample, pre_production_sample: @production.pre_production_sample, production_start: @production.production_start }
    end

    assert_redirected_to production_path(assigns(:production))
  end

  test "should show production" do
    get :show, id: @production
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @production
    assert_response :success
  end

  test "should update production" do
    put :update, id: @production, production: { QC_final: @production.QC_final, QC_in_production: @production.QC_in_production, customer_approval_counter_sample: @production.customer_approval_counter_sample, factory_counter_sample: @production.factory_counter_sample, pre_production_sample: @production.pre_production_sample, production_start: @production.production_start }
    assert_redirected_to production_path(assigns(:production))
  end

  test "should destroy production" do
    assert_difference('Production.count', -1) do
      delete :destroy, id: @production
    end

    assert_redirected_to productions_path
  end
end
