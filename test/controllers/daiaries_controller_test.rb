require 'test_helper'

class DaiariesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daiary = daiaries(:one)
  end

  test "should get index" do
    get daiaries_url
    assert_response :success
  end

  test "should get new" do
    get new_daiary_url
    assert_response :success
  end

  test "should create daiary" do
    assert_difference('Daiary.count') do
      post daiaries_url, params: { daiary: { name: @daiary.name, start_time: @daiary.start_time } }
    end

    assert_redirected_to daiary_url(Daiary.last)
  end

  test "should show daiary" do
    get daiary_url(@daiary)
    assert_response :success
  end

  test "should get edit" do
    get edit_daiary_url(@daiary)
    assert_response :success
  end

  test "should update daiary" do
    patch daiary_url(@daiary), params: { daiary: { name: @daiary.name, start_time: @daiary.start_time } }
    assert_redirected_to daiary_url(@daiary)
  end

  test "should destroy daiary" do
    assert_difference('Daiary.count', -1) do
      delete daiary_url(@daiary)
    end

    assert_redirected_to daiaries_url
  end
end
