# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Location.create(
        name: "Online Only"
)

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

