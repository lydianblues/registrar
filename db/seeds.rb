# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

students = [
	Student.create!(wp_first_name: "Bill", wp_last_name: "Rogers", 
		wp_email: "bill@hoptoad.com", occupation: "carpenter", organization: "aflcio",
		wp_id: 7, email_list: true),
	Student.create!(wp_first_name: "Dave", wp_last_name: "Plummer", 
		wp_email: "Dave@hoptoad.com", occupation: "shoemaker", organization: "leathercorp",
		wp_id: 8, email_list: false),
	Student.create!(wp_first_name: "Mary", wp_last_name: "StMarie", 
		wp_email: "mary@hoptoad.com", occupation: "saint", organization: "catholicism",
		wp_id: 67, email_list: true),
	Student.create!(wp_first_name: "Sue", wp_last_name: "Painter", 
		wp_email: "sue@hoptoad.com", occupation: "school principal", organization: "NEA",
		wp_id: 709, email_list: true),
	Student.create!(wp_first_name: "Artur", wp_last_name: "Pineapple", 
		wp_email: "artur@squarepants.com", occupation: "teacher", organization: "NEA",
		wp_id: 45, email_list: false),

	Student.create!(wp_first_name: "Charles", wp_last_name: "MacDuff", 
		wp_email: "charles@macbeth.com", occupation: "thane", organization: "royal society",
		wp_id: 101, email_list: true),
	Student.create!(wp_first_name: "Stu", wp_last_name: "Pickles", 
		wp_email: "stu@rugrats.com", occupation: "inventor", organization: "very little",
		wp_id: 102, email_list: false),
	Student.create!(wp_first_name: "Grandpa", wp_last_name: "Pickles", 
		wp_email: "grandpa@rugrats.com", occupation: "child care", organization: "sleep society",
		wp_id: 103, email_list: true),
	Student.create!(wp_first_name: "Chaz", wp_last_name: "Pickles", 
		wp_email: "chaz@rugrats.com", occupation: "accountat", organization: "boring league",
		wp_id: 104, email_list: true),
	Student.create!(wp_first_name: "Bob", wp_last_name: "SquarePants", 
		wp_email: "bob@undersea.com", occupation: "entertainer", organization: "ASCAP",
		wp_id: 105, email_list: false),
	Student.create!(wp_first_name: "Bill", wp_last_name: "Fillip", 
		wp_email: "bill@filli.com", occupation: "carpenter", organization: "aflcio",
		wp_id: 700, email_list: true, student_discount:true),
	Student.create!(wp_first_name: "Killi", wp_last_name: "dwarf", 
		wp_email: "killi@middleearth.com", occupation: "digger", organization: "leathercorp",
		wp_id: 708, email_list: false, student_discount:true),

	Student.create!(wp_first_name: "Mary", wp_last_name: "StMarie", 
		wp_email: "bombur@middleearth.com", occupation: "saint", organization: "catholicism",
		wp_id: 767, email_list: true, student_discount:true),
	Student.create!(wp_first_name: "Sue", wp_last_name: "Painter", 
		wp_email: "bifur@middleearth.com", occupation: "school principal", organization: "NEA",
		wp_id: 7709, email_list: true, student_discount:true),
	Student.create!(wp_first_name: "Artur", wp_last_name: "Pineapple", 
		wp_email: "gandalf@middleearth.com", occupation: "teacher", organization: "NEA",
		wp_id: 745, email_list: false, student_discount:true),
	Student.create!(wp_first_name: "Charles", wp_last_name: "MacDuff", 
		wp_email: "sauron@middleearth.com", occupation: "thane", organization: "royal society",
		wp_id: 7101, email_list: true, student_discount:true),
	Student.create!(wp_first_name: "Stu", wp_last_name: "Pickles", 
		wp_email: "saruman@middleearth.com", occupation: "inventor", organization: "very little",
		wp_id: 7102, email_list: false, student_discount:true),
	Student.create!(wp_first_name: "Grandpa", wp_last_name: "Pickles", 
		wp_email: "sgamgee@middleearth.com", occupation: "child care", organization: "sleep society",
		wp_id: 7103, email_list: true, student_discount:true),
	Student.create!(wp_first_name: "Chaz", wp_last_name: "Pickles", 
		wp_email: "galadriel@middleearth.com", occupation: "accountat", organization: "boring league",
		wp_id: 7104, email_list: true, student_discount:true),
	Student.create!(wp_first_name: "Bob", wp_last_name: "SquarePants", 
		wp_email: "smaug@middleearth.com", occupation: "entertainer", organization: "ASCAP",
		wp_id: 7105, email_list: false, student_discount:true)
]

#####################################################

first_names = [
	"Bill",
	"Steve",
	"Tom",
	"Joe",
	"Mary",
	"Sue",
	"Lavinia",
	"Arthur",
	"Mistilav",
	"Hope",
	"Annie",
	"Jennifer",
	"Meghan",
	"Charles",
	"Akhmed",
	"Sammy"
]

last_names = [
	"Hooper",
	"Looper",
	"Salient",
	"Pinapple",
	"Veggies",
	"Shankara",
	"Patanjali",
	"Bologna",
	"Partier",
	"Dark",
	"Light",
	"Samovar",
	"Sartorius",
	"Pretor",
	"Lavendar",
	"Elliver"
]

emails = [
	"Vivekananda@ashram.org",
	"veggies@ashram.org",
	"samovar@coffeehouse.com",
	"pleey@tartar.com",
	"prof@stanford.edu",
	"hite@standord.edu",
	"bill@stanford.edu",
	"mary@stanford.edu",
	"larry@stooges.com",
	"curly@stooges.com",
	"moe@stooges.com",
	"hopakonanda@hoptoad.com",
	"larry@stooges.com",
	"curly@stooges.com",
	"moe@stooges.com",
	"hopakonanda@hoptoad.com"
]

occupations = [
	"laborer",
	"programmer",
	"baker",
	"sailor",
	"carpenter",
	"yoga teacher",
	"yoga therapist",
	"author",
	"scrivener",
	"cannabis grower",
	"cannibis consumer",
	"rehab counselor",
	"junkie",
	"cannibis purveyor",
	"actress",
	"steward"
]

organizations = [
	"peace for all",
	"AFL-CIO",
	"yoga alliance",
	"yoga axis",
	"yoga for rehab",
	"yoganandas family",
	"carter foundation",
	"bill and melinda gates foundation",
	"amityville horror",
	"day of living dead",
	"brady bunch",
	"stormtroopers for change",
	"street people for change",
	"village people",
	"People power",
	"up with people"
]

# TODO Make the email address unique.
(1..1000).each do |i|
	Student.create!(
		wp_first_name: first_names[-1 + rand(16)],
		wp_last_name: last_names[-1 + rand(16)], 
		wp_email: "x" + i.to_s + emails[-1 + rand(16)],
		occupation: occupations[-1 + rand(16)],
		organization: organizations[-1 + rand(16)],
		wp_id: 9999 + i, email_list: true, student_discount:true)
end


######################################################

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
	Facilitator.create(name: "BK Bose", email: "bk@niroga.org",
		 description: "the one and only", home_city: "Berkeley"),
	Facilitator.create(name: "Adi Shankara", description: "Advaita Vedanta scholar",
		email: "adi@advaita.org", home_city: "Kaschi"),
	Facilitator.create(name: "Hariharananda Giri", description: "yogic scholar",
		email: "hari@santosa.org", home_city: "Veranasi"),
	Facilitator.create(name: "Patanjali", description: "sutra guy",
		email: "snakes@yogasource.org", home_city: "Bhopal"),
	Facilitator.create(name: "Shrihukteshwar Giri", description: "teacher of Yogananada",
		email: "shri@rishikesh.india.com", home_city: "Pune"),
	Facilitator.create(name: "Paramahamsa Yogananda", description: "famous autobiographer",
		email: "param@yoga.org", home_city: "Venice Beach"),
	Facilitator.create(name: "Swami Vivekananda", description: "brought yoga to America",
		email: "vivi@purusha.org", home_city: "Benares"),
	Facilitator.create(name: "Vijñānabhikṣu", description: "16 century commentator on the sutras",
		email: "vij@indianyoga.com", home_city: "Antwerp")
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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
		regular_price_cents: 8000, group_price_cents: 7000, student_price_cents: 6500,
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

# Group 4 has more than 5 students
groups[4].students << students[5]
groups[4].students << students[6]
groups[4].students << students[7]
groups[4].students << students[8]
groups[4].students << students[9]
groups[4].students << students[10] # student discount
groups[4].students << students[11] # student discount

# Group 1 has fewer than 5 students
groups[1].students << students[8]
groups[1].students << students[9]
groups[1].students << students[10] # student discount
groups[1].students << students[11] # student discount


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






