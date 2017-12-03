require 'test_helper'

class TypeScaffoldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_scaffold = type_scaffolds(:one)
  end

  test "should get index" do
    get type_scaffolds_url
    assert_response :success
  end

  test "should get new" do
    get new_type_scaffold_url
    assert_response :success
  end

  test "should create type_scaffold" do
    assert_difference('TypeScaffold.count') do
      post type_scaffolds_url, params: { type_scaffold: {  } }
    end

    assert_redirected_to type_scaffold_url(TypeScaffold.last)
  end

  test "should show type_scaffold" do
    get type_scaffold_url(@type_scaffold)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_scaffold_url(@type_scaffold)
    assert_response :success
  end

  test "should update type_scaffold" do
    patch type_scaffold_url(@type_scaffold), params: { type_scaffold: {  } }
    assert_redirected_to type_scaffold_url(@type_scaffold)
  end

  test "should destroy type_scaffold" do
    assert_difference('TypeScaffold.count', -1) do
      delete type_scaffold_url(@type_scaffold)
    end

    assert_redirected_to type_scaffolds_url
  end
end
