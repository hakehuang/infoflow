require 'test_helper'

class ContractsControllerTest < ActionController::TestCase
  setup do
    @contract = contracts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contracts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contract" do
    assert_difference('Contract.count') do
      post :create, contract: { deposit_rcvd_date: @contract.deposit_rcvd_date, details: @contract.details, number: @contract.number, payment_tt_data: @contract.payment_tt_data, prefoma_sale_date: @contract.prefoma_sale_date }
    end

    assert_redirected_to contract_path(assigns(:contract))
  end

  test "should show contract" do
    get :show, id: @contract
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contract
    assert_response :success
  end

  test "should update contract" do
    put :update, id: @contract, contract: { deposit_rcvd_date: @contract.deposit_rcvd_date, details: @contract.details, number: @contract.number, payment_tt_data: @contract.payment_tt_data, prefoma_sale_date: @contract.prefoma_sale_date }
    assert_redirected_to contract_path(assigns(:contract))
  end

  test "should destroy contract" do
    assert_difference('Contract.count', -1) do
      delete :destroy, id: @contract
    end

    assert_redirected_to contracts_path
  end
end
