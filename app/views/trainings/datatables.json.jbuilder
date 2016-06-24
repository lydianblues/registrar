json.draw @draw
json.recordsTotal @recordsTotal
json.recordsFiltered @recordsFiltered

json.data do |json|
	json.array!(@training_views) do |training_view|

		json.course raw render(template: 'trainings/_course.html.erb',
			locals: {course: training_view.course, id:training_view.course_id })

		json.code raw render(template: 'trainings/_code.html.erb',
			locals: {code: training_view.code, id: training_view.training_id })

		json.extract! training_view, :start, :end, :city

		json.edit_button raw render(template: 'trainings/_edit_button.html.erb',
			locals: {id: training_view.training_id})
		
		json.delete_button raw render(template: 'trainings/_delete_button.html.erb',
			locals: {id: training_view.training_id})
	end
end
