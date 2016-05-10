json.array!(@registrations) do |registration|
  json.extract! registration, :id, :registerable_id, :registerable_type, :paid_for, :amt_paid, :sign_up_date, :auth_code, :refunded
  json.url registration_url(registration, format: :json)
end
