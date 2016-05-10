# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = [
	Student.create(first_name: "Bill", last_name: "Rogers", 
		wp_user_email: "bill@hoptoad.com", occupation: "carpenter", organization: "aflcio"),
	Student.create(first_name: "Dave", last_name: "Plummer", 
		wp_user_email: "Dave@hoptoad.com", occupation: "shoemaker", organization: "leathercorp"),
	Student.create(first_name: "Mary", last_name: "StMarie", 
		wp_user_email: "mary@hoptoad.com", occupation: "saint", organization: "catholicism"),
	Student.create(first_name: "Sue", last_name: "Painter", 
		wp_user_email: "sue@hoptoad.com", occupation: "school principal", organization: "NEA"),
	Student.create(first_name: "Artur", last_name: "Pineapple", 
		wp_user_email: "artur@squarepants.com", occupation: "teacher", organization: "NEA")
]

courses = [
	Course.create(name: "dynamic mindfulness intro", description: "a good thing"),
	Course.create(name: "dynamic mindfulness advanced", description: "more of a good thing"),
	Course.create(name: "dynamic mindfulness online", description: "abstraction of a good thing"),
	Course.create(name: "DMF for plumbers", description: "all about pipes"),
	Course.create(name: "DMF for programmers", description: "sorely needed")
]

locations = [
	Location.create(name: "Oakland Peace Center", street_1: "48 Fell St", street_2: "Box 493",
	 city: "Oakland", state: "CA", zip: 94577, notes: "The main site"),
	Location.create(name: "Kansas City Peace Center", street_1: "48 Fell St", street_2: "Box 493",
	 city: "Kansas City", state: "MI", zip: 34577, notes: "Here we come"),
	Location.create(name: "Antwerp Peace Center", street_1: "Koenigstrasse 333", 
		 city: "Antwerp",  country: "Belgium", notes: "Where we go for fun")
]

facilitators = [
	Facilitator.create(name: "BK Bose", description: "the one and only"),
	Facilitator.create(name: "Adi Shankara", description: "Advaita Vedanta scholar"),
	Facilitator.create(name: "Hariharananda Giri", description: "yogic scholar"),
	Facilitator.create(name: "Patanjali", description: "sutra guy"),
	Facilitator.create(name: "Shrihukteshwar Giri", description: "teacher of Yogananada"),
	Facilitator.create(name: "Paramahamsa Yogananda", description: "famous autobiographer"),
	Facilitator.create(name: "Swami Vivekananda", description: "brought yoga to America"),
	Facilitator.create(name: "Vijanabhiksu", description: "16 century commentator on the sutras")
]

early_dates = [
	Date.new(2016, 7, 1),
	Date.new(2016, 7, 2),
	Date.new(2016, 7, 3),
	Date.new(2016, 7, 4),
	Date.new(2016, 7, 5),
	Date.new(2016, 7, 6),
	Date.new(2016, 7, 7),
	Date.new(2016, 7, 8),
	Date.new(2016, 7, 9),
	Date.new(2016, 7, 10),
	Date.new(2016, 7, 11),
	Date.new(2016, 7, 12),
	Date.new(2016, 7, 13),
	Date.new(2016, 7, 14),
	Date.new(2016, 7, 15),
	Date.new(2016, 7, 16)
]

late_dates = [
	Date.new(2016, 8, 1),
	Date.new(2016, 8, 2),
	Date.new(2016, 8, 3),
	Date.new(2016, 8, 4),
	Date.new(2016, 8, 5),
	Date.new(2016, 8, 6),
	Date.new(2016, 8, 7),
	Date.new(2016, 8, 8),
	Date.new(2016, 8, 9),
	Date.new(2016, 8, 10),
	Date.new(2016, 8, 11),
	Date.new(2016, 8, 12),
	Date.new(2016, 8, 13),
	Date.new(2016, 8, 14),
	Date.new(2016, 8, 15),
	Date.new(2016, 8, 16)
]



trainings = [
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id),
	Training.create(
		start_date: early_dates[-1 + rand(16)],
		end_date: late_dates[-1 + rand(16)],
		code: 999 + rand(9000),
		early_cost: 89.56, late_cost: 100.01, staff_cost: 500.00,
		new_registration_closed: late_dates[-1 + rand(16)],
		early_registration_cutoff: early_dates[-1 + rand(16)],
		min_attendees: 2, max_attendees: 100,
		course_id: courses[-1 + rand(5)].id,
		facilitator_id: facilitators[-1 + rand(8)].id,
		location_id: locations[-1 + rand(3)].id)
]

groups = [
	Group.create(leader_first: "Salmon", leader_last: "Rushdie", tag: "alpha", leader: students[0]),
	Group.create(leader_first: "Menehuna", leader_last: "Raja", tag: "beta", leader: students[1]),
	Group.create(leader_first: "Richard", leader_last: "Nixon", tag: "gamma", leader: students[2]),
	Group.create(leader_first: "Gerald", leader_last: "Ford", tag: "delta", leader: students[2]),
	Group.create(leader_first: "Lyndon", leader_last: "Johnson", tag: "epsilon", leader: students[2]),
	Group.create(leader_first: "Salmon", leader_last: "Rushdie", tag: "zeta", leader: students[4])
]

Registration.create(
	registerable: students[0],
	training: trainings[0],
	code: 9999 + rand(90000))

Registration.create(
	registerable: students[1],
	training: trainings[1],
	code: 9999 + rand(90000))

Registration.create(
	registerable: groups[5],
	training: trainings[0],
	code: 9999 + rand(90000))

Registration.create(
	registerable: groups[4],
	training: trainings[0],
	code: 9999 + rand(90000))

__END__






