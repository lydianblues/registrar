json.data do |json|
	json.array!(@students) do |student|
		json.full_name raw render(template: 'students/_full_name.html.erb', locals: {student: student})
  		json.extract! student, :wp_email, :occupation, :organization
  		json.edit_button raw render(template: 'students/_edit_button.html.erb', locals: {student: student})
  		json.delete_button raw render(template: 'students/_delete_button.html.erb', locals: {student: student})
	end
end
