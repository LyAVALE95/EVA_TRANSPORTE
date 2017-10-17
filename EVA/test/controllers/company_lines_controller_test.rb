require 'test_helper'

class CompanyLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_line = company_lines(:one)
  end

  test "should get index" do
    get company_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_company_line_url
    assert_response :success
  end

  test "should create company_line" do
    assert_difference('CompanyLine.count') do
      post company_lines_url, params: { company_line: {  } }
    end

    assert_redirected_to company_line_url(CompanyLine.last)
  end

  test "should show company_line" do
    get company_line_url(@company_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_company_line_url(@company_line)
    assert_response :success
  end

  test "should update company_line" do
    patch company_line_url(@company_line), params: { company_line: {  } }
    assert_redirected_to company_line_url(@company_line)
  end

  test "should destroy company_line" do
    assert_difference('CompanyLine.count', -1) do
      delete company_line_url(@company_line)
    end

    assert_redirected_to company_lines_url
  end
end
