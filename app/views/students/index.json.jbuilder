json.array!(@students) do |student|
  json.extract! student, :id, :first_name, :last_name, :wp_user_email, :occupation, :organization
  json.url student_url(student, format: :json)
end
