require 'test_helper'

class WorseConditionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @worse_condition = worse_conditions(:one)
  end

  test "should get index" do
    get worse_conditions_url
    assert_response :success
  end

  test "should get new" do
    get new_worse_condition_url
    assert_response :success
  end

  test "should create worse_condition" do
    assert_difference('WorseCondition.count') do
      post worse_conditions_url, params: { worse_condition: { content: @worse_condition.content } }
    end

    assert_redirected_to worse_condition_url(WorseCondition.last)
  end

  test "should show worse_condition" do
    get worse_condition_url(@worse_condition)
    assert_response :success
  end

  test "should get edit" do
    get edit_worse_condition_url(@worse_condition)
    assert_response :success
  end

  test "should update worse_condition" do
    patch worse_condition_url(@worse_condition), params: { worse_condition: { content: @worse_condition.content } }
    assert_redirected_to worse_condition_url(@worse_condition)
  end

  test "should destroy worse_condition" do
    assert_difference('WorseCondition.count', -1) do
      delete worse_condition_url(@worse_condition)
    end

    assert_redirected_to worse_conditions_url
  end
end
