json.draw @draw
json.recordsTotal @recordsTotal
json.recordsFiltered @recordsFiltered

json.data do |json|
	json.array!(@trainings) do |training|

		json.course raw render(template: 'trainings/_course.html.erb',
			locals: {course: training.course, id:training.course_id })

		json.code raw render(template: 'trainings/_code.html.erb',
			locals: {code: training.code, id: training.training_id })

		json.extract! training, :start, :end, :city

		json.edit_button raw render(template: 'trainings/_edit_button.html.erb',
			locals: {id: training.training_id})
		
		json.delete_button raw render(template: 'trainings/_delete_button.html.erb',
			locals: {id: training.training_id})
	end
end
