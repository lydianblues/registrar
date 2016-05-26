# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = [
	Student.create(wp_first_name: "Bill", wp_last_name: "Rogers", 
		wp_email: "bill@hoptoad.com", occupation: "carpenter", organization: "aflcio",
		wp_id: 7, email_list: true),
	Student.create(wp_first_name: "Dave", wp_last_name: "Plummer", 
		wp_email: "Dave@hoptoad.com", occupation: "shoemaker", organization: "leathercorp",
		wp_id: 8, email_list: false),
	Student.create(wp_first_name: "Mary", wp_last_name: "StMarie", 
		wp_email: "mary@hoptoad.com", occupation: "saint", organization: "catholicism",
	wp_id: 67, email_list: true),
	Student.create(wp_first_name: "Sue", wp_last_name: "Painter", 
		wp_email: "sue@hoptoad.com", occupation: "school principal", organization: "NEA",
		wp_id: 709, email_list: true),
	Student.create(wp_first_name: "Artur", wp_last_name: "Pineapple", 
		wp_email: "artur@squarepants.com", occupation: "teacher", organization: "NEA",
		wp_id: 45, email_list: false)
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
	Group.create(tag: "alpha", owner: students[0]),
	Group.create(tag: "beta", owner: students[1]),
	Group.create(tag: "gamma", owner: students[2]),
	Group.create(tag: "delta", owner: students[2]),
	Group.create(tag: "epsilon", owner: students[2]),
	Group.create(tag: "zeta", owner: students[4])
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

User.create(
	email: "admin@niroga.org",
	password: "harpenter911",
	password_confirmation: "harpenter911",
	admin: true
)

User.create(
	email: "mbs@niroga.org",
	password: "harpenter911",
	password_confirmation: "harpenter911",
	admin: false
)

__END__






