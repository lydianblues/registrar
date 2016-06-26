json.draw @draw
json.recordsTotal @recordsTotal
json.recordsFiltered @recordsFiltered

json.data do |json|
	json.array!(@registrations) do |registration|

		json.extract! registration, :registration_code, :course_name, :training_code, :owner_name,
			:registrant, :paid_for, :updated_at

		json.edit_button "Edit"

		json.delete_button "Delete"
	end
end
