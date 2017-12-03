require 'test_helper'

class CarrierLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @carrier_line = carrier_lines(:one)
  end

  test "should get index" do
    get carrier_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_carrier_line_url
    assert_response :success
  end

  test "should create carrier_line" do
    assert_difference('CarrierLine.count') do
      post carrier_lines_url, params: { carrier_line: {  } }
    end

    assert_redirected_to carrier_line_url(CarrierLine.last)
  end

  test "should show carrier_line" do
    get carrier_line_url(@carrier_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_carrier_line_url(@carrier_line)
    assert_response :success
  end

  test "should update carrier_line" do
    patch carrier_line_url(@carrier_line), params: { carrier_line: {  } }
    assert_redirected_to carrier_line_url(@carrier_line)
  end

  test "should destroy carrier_line" do
    assert_difference('CarrierLine.count', -1) do
      delete carrier_line_url(@carrier_line)
    end

    assert_redirected_to carrier_lines_url
  end
end
