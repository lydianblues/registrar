require 'test_helper'

class FacilitatorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @facilitator = facilitators(:one)
  end

  test "should get index" do
    get facilitators_url
    assert_response :success
  end

  test "should get new" do
    get new_facilitator_url
    assert_response :success
  end

  test "should create facilitator" do
    assert_difference('Facilitator.count') do
      post facilitators_url, params: { facilitator: { description: @facilitator.description, name: @facilitator.name } }
    end

    assert_redirected_to facilitator_path(Facilitator.last)
  end

  test "should show facilitator" do
    get facilitator_url(@facilitator)
    assert_response :success
  end

  test "should get edit" do
    get edit_facilitator_url(@facilitator)
    assert_response :success
  end

  test "should update facilitator" do
    patch facilitator_url(@facilitator), params: { facilitator: { description: @facilitator.description, name: @facilitator.name } }
    assert_redirected_to facilitator_path(@facilitator)
  end

  test "should destroy facilitator" do
    assert_difference('Facilitator.count', -1) do
      delete facilitator_url(@facilitator)
    end

    assert_redirected_to facilitators_path
  end
end
