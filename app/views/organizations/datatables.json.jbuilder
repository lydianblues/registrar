json.draw @draw
json.recordsTotal @recordsTotal
json.recordsFiltered @recordsFiltered

json.data do |json|
	json.array!(@organizations) do |organization|
  		json.extract! organization, :id, :created_at, :updated_at
	end
end
