json.array!(@trainings) do |training|
  json.extract! training, :id, :start_date, :end_date, :code, :early_cost, :early_cost, :late_cost, :late_cost, :new_registration_closed, :early_registration_cutoff, :max_attendees, :min_attendees, :course_id, :facilitator_id, :location_id
  json.url training_url(training, format: :json)
end
