require 'test_helper'

class TrainingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @training = trainings(:one)
  end

  test "should get index" do
    get trainings_url
    assert_response :success
  end

  test "should get new" do
    get new_training_url
    assert_response :success
  end

  test "should create training" do
    assert_difference('Training.count') do
      post trainings_url, params: { training: { code: @training.code, course_id: @training.course_id, early_cost: @training.early_cost, early_cost: @training.early_cost, early_registration_cutoff: @training.early_registration_cutoff, end_date: @training.end_date, facilitator_id: @training.facilitator_id, late_cost: @training.late_cost, late_cost: @training.late_cost, location_id: @training.location_id, new_registration_closed: @training.new_registration_closed, start_date: @training.start_date } }
    end

    assert_redirected_to training_path(Training.last)
  end

  test "should show training" do
    get training_url(@training)
    assert_response :success
  end

  test "should get edit" do
    get edit_training_url(@training)
    assert_response :success
  end

  test "should update training" do
    patch training_url(@training), params: { training: { code: @training.code, course_id: @training.course_id, early_cost: @training.early_cost, early_cost: @training.early_cost, early_registration_cutoff: @training.early_registration_cutoff, end_date: @training.end_date, facilitator_id: @training.facilitator_id, late_cost: @training.late_cost, late_cost: @training.late_cost, location_id: @training.location_id, new_registration_closed: @training.new_registration_closed, start_date: @training.start_date } }
    assert_redirected_to training_path(@training)
  end

  test "should destroy training" do
    assert_difference('Training.count', -1) do
      delete training_url(@training)
    end

    assert_redirected_to trainings_path
  end
end
