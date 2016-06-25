json.draw @draw
json.recordsTotal @recordsTotal
json.recordsFiltered @recordsFiltered

json.data do |json|
	json.array!(@courses) do |course|

		json.extract! course, :course, :description

		json.edit_button raw render(template: 'courses/_edit_button.html.erb',
			locals: {id: course.course_id})
		
		json.delete_button raw render(template: 'courses/_delete_button.html.erb',
			locals: {id: course.course_id})
	end
end