require 'test_helper'

class ClientcontactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clientcontact = clientcontacts(:one)
  end

  test "should get index" do
    get clientcontacts_url
    assert_response :success
  end

  test "should get new" do
    get new_clientcontact_url
    assert_response :success
  end

  test "should create clientcontact" do
    assert_difference('Clientcontact.count') do
      post clientcontacts_url, params: { clientcontact: {  } }
    end

    assert_redirected_to clientcontact_url(Clientcontact.last)
  end

  test "should show clientcontact" do
    get clientcontact_url(@clientcontact)
    assert_response :success
  end

  test "should get edit" do
    get edit_clientcontact_url(@clientcontact)
    assert_response :success
  end

  test "should update clientcontact" do
    patch clientcontact_url(@clientcontact), params: { clientcontact: {  } }
    assert_redirected_to clientcontact_url(@clientcontact)
  end

  test "should destroy clientcontact" do
    assert_difference('Clientcontact.count', -1) do
      delete clientcontact_url(@clientcontact)
    end

    assert_redirected_to clientcontacts_url
  end
end
