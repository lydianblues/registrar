json.draw @draw
json.recordsTotal @recordsTotal
json.recordsFiltered @recordsFiltered

json.data do |json|
	json.array!(@locations) do |location|

		json.location_name raw render(template: 'locations/_location.html.erb',
			locals: {location: location.location_name, id: location.location_id })

		json.extract! location, :city

		json.edit_button raw render(template: 'locations/_edit_button.html.erb',
			locals: {id: location.location_id})
	
		json.delete_button raw render(template: 'locations/_delete_button.html.erb',
			locals: {id: location.location_id})
	end
end
