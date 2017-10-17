require 'test_helper'

class MTsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mt = mts(:one)
  end

  test "should get index" do
    get mts_url
    assert_response :success
  end

  test "should get new" do
    get new_mt_url
    assert_response :success
  end

  test "should create mt" do
    assert_difference('Mt.count') do
      post mts_url, params: { mt: {  } }
    end

    assert_redirected_to mt_url(Mt.last)
  end

  test "should show mt" do
    get mt_url(@mt)
    assert_response :success
  end

  test "should get edit" do
    get edit_mt_url(@mt)
    assert_response :success
  end

  test "should update mt" do
    patch mt_url(@mt), params: { mt: {  } }
    assert_redirected_to mt_url(@mt)
  end

  test "should destroy mt" do
    assert_difference('Mt.count', -1) do
      delete mt_url(@mt)
    end

    assert_redirected_to mts_url
  end
end
