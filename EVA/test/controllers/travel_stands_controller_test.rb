require 'test_helper'

class TravelStandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_stand = travel_stands(:one)
  end

  test "should get index" do
    get travel_stands_url
    assert_response :success
  end

  test "should get new" do
    get new_travel_stand_url
    assert_response :success
  end

  test "should create travel_stand" do
    assert_difference('TravelStand.count') do
      post travel_stands_url, params: { travel_stand: {  } }
    end

    assert_redirected_to travel_stand_url(TravelStand.last)
  end

  test "should show travel_stand" do
    get travel_stand_url(@travel_stand)
    assert_response :success
  end

  test "should get edit" do
    get edit_travel_stand_url(@travel_stand)
    assert_response :success
  end

  test "should update travel_stand" do
    patch travel_stand_url(@travel_stand), params: { travel_stand: {  } }
    assert_redirected_to travel_stand_url(@travel_stand)
  end

  test "should destroy travel_stand" do
    assert_difference('TravelStand.count', -1) do
      delete travel_stand_url(@travel_stand)
    end

    assert_redirected_to travel_stands_url
  end
end
