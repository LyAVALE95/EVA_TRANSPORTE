require 'test_helper'

class RateExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rate_expense = rate_expenses(:one)
  end

  test "should get index" do
    get rate_expenses_url
    assert_response :success
  end

  test "should get new" do
    get new_rate_expense_url
    assert_response :success
  end

  test "should create rate_expense" do
    assert_difference('RateExpense.count') do
      post rate_expenses_url, params: { rate_expense: {  } }
    end

    assert_redirected_to rate_expense_url(RateExpense.last)
  end

  test "should show rate_expense" do
    get rate_expense_url(@rate_expense)
    assert_response :success
  end

  test "should get edit" do
    get edit_rate_expense_url(@rate_expense)
    assert_response :success
  end

  test "should update rate_expense" do
    patch rate_expense_url(@rate_expense), params: { rate_expense: {  } }
    assert_redirected_to rate_expense_url(@rate_expense)
  end

  test "should destroy rate_expense" do
    assert_difference('RateExpense.count', -1) do
      delete rate_expense_url(@rate_expense)
    end

    assert_redirected_to rate_expenses_url
  end
end
