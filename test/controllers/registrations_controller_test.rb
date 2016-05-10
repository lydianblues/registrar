require 'test_helper'

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @registration = registrations(:one)
  end

  test "should get index" do
    get registrations_url
    assert_response :success
  end

  test "should get new" do
    get new_registration_url
    assert_response :success
  end

  test "should create registration" do
    assert_difference('Registration.count') do
      post registrations_url, params: { registration: { amt_paid: @registration.amt_paid, auth_code: @registration.auth_code, paid_for: @registration.paid_for, refunded: @registration.refunded, registerable_id: @registration.registerable_id, registerable_type: @registration.registerable_type, sign_up_date: @registration.sign_up_date } }
    end

    assert_redirected_to registration_path(Registration.last)
  end

  test "should show registration" do
    get registration_url(@registration)
    assert_response :success
  end

  test "should get edit" do
    get edit_registration_url(@registration)
    assert_response :success
  end

  test "should update registration" do
    patch registration_url(@registration), params: { registration: { amt_paid: @registration.amt_paid, auth_code: @registration.auth_code, paid_for: @registration.paid_for, refunded: @registration.refunded, registerable_id: @registration.registerable_id, registerable_type: @registration.registerable_type, sign_up_date: @registration.sign_up_date } }
    assert_redirected_to registration_path(@registration)
  end

  test "should destroy registration" do
    assert_difference('Registration.count', -1) do
      delete registration_url(@registration)
    end

    assert_redirected_to registrations_path
  end
end
