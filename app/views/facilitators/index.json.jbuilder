json.array!(@facilitators) do |facilitator|
  json.extract! facilitator, :id, :name, :description
  json.url facilitator_url(facilitator, format: :json)
end
