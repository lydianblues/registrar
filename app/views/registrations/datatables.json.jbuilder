json.draw @draw
json.recordsTotal @recordsTotal
json.recordsFiltered @recordsFiltered

json.data do |json|
	json.array!(@registrations) do |registration|

		json.registration_code raw render(template: 'registrations/_registration.html.erb',
			locals: {registration_code: registration.registration_code,
			id: registration.registration_id })

		json.course_name raw render(template: 'registrations/_course.html.erb',
			locals: {course: registration.course_name, id: registration.course_id })

		json.training_code raw render(template: 'registrations/_training.html.erb',
			locals: {training: registration.training_code, id: registration.training_id })

		json.owner_name raw render(template: 'registrations/_owner.html.erb',
			locals: {owner: registration.owner_name, id: registration.owner_id })

		json.registrant raw render(template: 'registrations/_registrant.html.erb',
			locals: {registrant: registration.registrant, id: registration.registerable_id,
				type: registration.registerable_type })

		json.extract! registration, :paid_for, :updated_at

		json.edit_button raw render(template: 'registrations/_edit_button.html.erb',
			locals: {id: registration.registration_id})
		
		json.delete_button raw render(template: 'registrations/_delete_button.html.erb',
			locals: {id: registration.registration_id})

		
	end
end
