json.draw @draw
json.recordsTotal @recordsTotal
json.recordsFiltered @recordsFiltered

json.data do |json|
	json.array!(@facilitators) do |facilitator|

		json.name raw render(template: 'facilitators/_facilitator.html.erb',
			locals: {facilitator: facilitator.name, id: facilitator.facilitator_id })

		json.extract! facilitator, :email, :description, :home_city

		json.edit_button raw render(template: 'facilitators/_edit_button.html.erb',
			locals: {id: facilitator.facilitator_id})
	
		json.delete_button raw render(template: 'facilitators/_delete_button.html.erb',
			locals: {id: facilitator.facilitator_id})
	end
end
