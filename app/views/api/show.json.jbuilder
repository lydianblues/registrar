json.extract! @registration, :id, :updated_at, :reg_type, :code

json.formatted_price @registration.price.format
json.price @registration.price.to_d * 100 # cents as a double

json.owner do
	json.extract! @registration.owner, :wp_id, :wp_first_name, :wp_last_name,
		:wp_email, :wp_login, :occupation, :organization, :email_list,
		:created_at, :updated_at
end

json.course do
	json.extract! @registration.training.course, :name, :description
end

json.training do
	json.extract! @registration.training, :start_date, :end_date, :code
	json.extract! @registration.training, :end_date
	json.extract! @registration.training.location, :name, :street_1, :street_2, 
		:city, :state, :zip, :country, :notes
end

if @registration.registerable_type == "Student"
	json.student do
		json.extract! @registration.registerable, :wp_first_name, :wp_last_name,
			:wp_email, :occupation, :organization, :wp_login, :email_list
	end
end

if @registration.registerable_type == "Group"
	json.group @registration.registerable.students do |student|
		json.extract! student, :wp_id, :wp_first_name, :wp_last_name,
			:wp_email, :wp_login, :occupation, :organization, :email_list,
			:created_at, :updated_at
	end
end