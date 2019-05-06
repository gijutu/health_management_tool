require 'test_helper'

class BetterConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @better_condition = better_conditions(:one)
  end

  test "should get index" do
    get better_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_better_condition_url
    assert_response :success
  end

  test "should create better_condition" do
    assert_difference('BetterCondition.count') do
      post better_conditions_url, params: { better_condition: { content: @better_condition.content, string: @better_condition.string } }
    end

    assert_redirected_to better_condition_url(BetterCondition.last)
  end

  test "should show better_condition" do
    get better_condition_url(@better_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_better_condition_url(@better_condition)
    assert_response :success
  end

  test "should update better_condition" do
    patch better_condition_url(@better_condition), params: { better_condition: { content: @better_condition.content, string: @better_condition.string } }
    assert_redirected_to better_condition_url(@better_condition)
  end

  test "should destroy better_condition" do
    assert_difference('BetterCondition.count', -1) do
      delete better_condition_url(@better_condition)
    end

    assert_redirected_to better_conditions_url
  end
end
